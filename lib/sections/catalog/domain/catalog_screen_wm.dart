import 'package:eastern_dragon/di/dependencies.dart';
import 'package:eastern_dragon/sections/catalog/data/catalog_section_model.dart';
import 'package:eastern_dragon/sections/catalog/domain/catalog_screen_model.dart';
import 'package:eastern_dragon/sections/catalog/presentation/catalog_screen.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

abstract interface class ICatalogScreenWM implements IWidgetModel {
  /// Секции каталога с товарами
  EntityValueListenable<List<CatalogSectionModel>> get catalogSectionsListenable;

  /// Индекс выбранной секции в фильтре
  ListenableState<int> get selectedSectionListenable;

  ListenableState<bool> get isDrawerOpenListenable;

  Future<void> toggleDrawer();

  GlobalKey<SliderDrawerState> get sliderKey;

  Future<void> loadCatalog();

  Color get backgroundColor;
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

  final _catalogSectionsState = EntityStateNotifier<List<CatalogSectionModel>>();

  final _selectedSectionState = StateNotifier<int>(initValue: 0);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    loadCatalog();
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
}
