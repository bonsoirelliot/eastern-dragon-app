import 'package:eastern_dragon/core/di/dependencies.dart';
import 'package:eastern_dragon/features/catalog/data/catalog_section_model.dart';
import 'package:eastern_dragon/features/catalog/data/catalog_section_with_key_model.dart';
import 'package:eastern_dragon/features/catalog/domain/catalog_screen_model.dart';
import 'package:eastern_dragon/features/catalog/presentation/catalog_screen.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

abstract interface class ICatalogScreenWM implements IWidgetModel {
  /// Секции каталога с товарами
  EntityValueListenable<List<CatalogSectionModel>> get catalogSectionsListenable;

  /// Индекс выбранной секции в фильтре
  ListenableState<int> get selectedSectionListenable;

  /// Открыт ли дровер
  ListenableState<bool> get isDrawerOpenListenable;

  GlobalKey<SliderDrawerState> get sliderKey;

  Color get backgroundColor;

  List<CatalogSectionWithKeyModel> get sectionsWithKey;

  /// Контроллер для списка каталога
  ScrollController get bodyScrollController;

  /// Контроллер для фильров каталога
  AutoScrollController get filterScrollController;

  /// Метод загрузки данных каталога
  Future<void> loadCatalog();

  /// Метод откытия/закрытия дровера
  Future<void> toggleDrawer();

  void scrollToSection(int index);
}

CatalogScreenWM defaultCatalogScreenWMFactory(BuildContext context) {
  return CatalogScreenWM(
    CatalogScreenModel(
      requestHelper: Dependencies.of(context).requestHelper,
    ),
  );
}

class CatalogScreenWM extends WidgetModel<CatalogScreen, CatalogScreenModel> implements ICatalogScreenWM {
  CatalogScreenWM(CatalogScreenModel model) : super(model);

  @override
  late final backgroundColor = Theme.of(context).scaffoldBackgroundColor;

  final _isDrawerOpenState = StateNotifier<bool>(initValue: false);

  @override
  final sliderKey = GlobalKey<SliderDrawerState>();

  late final executor = Dependencies.of(context).executor;

  @override
  ListenableState<bool> get isDrawerOpenListenable => _isDrawerOpenState;

  @override
  ListenableState<int> get selectedSectionListenable => _selectedSectionState;

  @override
  EntityValueListenable<List<CatalogSectionModel>> get catalogSectionsListenable => _catalogSectionsState;

  @override
  List<CatalogSectionWithKeyModel> sectionsWithKey = [];

  @override
  final bodyScrollController = ScrollController();

  @override
  final filterScrollController = AutoScrollController();

  final _catalogSectionsState = EntityStateNotifier<List<CatalogSectionModel>>();

  final _selectedSectionState = StateNotifier<int>(initValue: 0);

  /// Список позиций для каждой секции
  List<double> _sectionsPositions = [];

  bool isScrolling = false;
  int currentIndex = 0;

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    loadCatalog();

    catalogSectionsListenable.addListener(sectionsValueListener);
    bodyScrollController.addListener(_bodyScrollListener);
  }

  @override
  void dispose() {
    catalogSectionsListenable.removeListener(sectionsValueListener);
    bodyScrollController.removeListener(_bodyScrollListener);
    super.dispose();
  }

  @override
  Future<void> loadCatalog() async {
    await executor.execute(
      model.loadCatalog,
      before: _catalogSectionsState.loading,
      onSuccess: (data) => _catalogSectionsState.content(data!),
      onError: _catalogSectionsState.error,
    );
  }

  @override
  Future<void> toggleDrawer() async {
    sliderKey.currentState?.toggle();
    _isDrawerOpenState.accept(!_isDrawerOpenState.value!);
  }

  void sectionsValueListener() {
    if (catalogSectionsListenable.value.isErrorState || catalogSectionsListenable.value.isLoadingState) {
      return;
    }

    sectionsWithKey = [];

    sectionsWithKey.addAll(
      catalogSectionsListenable.value.data!.where((e) => e.items.isNotEmpty).map(
            (e) => CatalogSectionWithKeyModel(
              key: GlobalKey(),
              model: e,
            ),
          ),
    );

    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        ///Рассчитываем позицию для всех секций
        // _calculateSectionsPositions().then((value) => _areSizesCalculatedState.accept(true));
        _calculateSectionsPositions();
      },
    );
  }

  void _bodyScrollListener() {
    if (isScrolling) return;

    /// Поиск индекса секции
    final idx = _searchCurrentIndex();

    if (idx == currentIndex) return;
    currentIndex = idx;

    _selectedSectionState.accept(currentIndex);
    if (!isScrolling) {
      filterScrollController
          .scrollToIndex(
            currentIndex,
            duration: const Duration(milliseconds: 200),
            preferPosition: AutoScrollPosition.middle,
          )
          .then(
            (value) => isScrolling = false,
          );
    }
  }

  @override
  Future<void> scrollToSection(int index) async {
    if (_selectedSectionState.value == index) return;
    isScrolling = true;
    _selectedSectionState.accept(index);
    // debugPrint('AZAZAZ ${sectionsWithKey}');
    await bodyScrollController.animateTo(
      _sectionsPositions[index],
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    isScrolling = false;
    await filterScrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.middle,
      duration: const Duration(milliseconds: 300),
    );
    isScrolling = false;
  }

  /// Вычисление позиций элементов каталога по списку ключей каталога
  ///
  /// Также здесь вычисляется массив отрезков для повышения производительности.
  Future<void> _calculateSectionsPositions() async {
    _sectionsPositions = sectionsWithKey
        .map(
          (category) => _calculatePosition(
            category.key,
            maxScrollExtent: bodyScrollController.position.maxScrollExtent,
          ),
        )
        .toList();
  }

  /// Вычисление offset по ключу [key].
  /// (этот код из Scrollable.ensureVisible: он нормально вычисляет позиции, без погрешностей)
  double _calculatePosition(GlobalKey key, {required double maxScrollExtent}) {
    final renderObject = key.currentContext!.findRenderObject() as RenderBox?;
    final viewport = RenderAbstractViewport.of(renderObject);
    final pos = viewport.getOffsetToReveal(renderObject!, 0.0).offset.clamp(0.0, maxScrollExtent).toDouble();
    return pos;
  }

  /// Поиск текущего индекса в зависимости от значения bodyScrollController.offset
  int _searchCurrentIndex() {
    var l = -1;
    var r = _sectionsPositions.length;

    while (l < r - 1) {
      final m = (l + r) ~/ 2;
      if (_sectionsPositions[m] < bodyScrollController.offset) {
        l = m;
      } else {
        r = m;
      }
    }
    if (r == 0) {
      return 0;
    }
    return r - 1;
  }
}
