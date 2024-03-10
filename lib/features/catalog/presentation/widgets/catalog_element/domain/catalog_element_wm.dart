// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:eastern_dragon/core/common/domain/snackbars_and_sheets/bottom_sheet_shower.dart';
import 'package:eastern_dragon/core/common/domain/snackbars_and_sheets/toast_shower.dart';
import 'package:eastern_dragon/core/common/presentation/widgets/default_loading_indicator.dart';
import 'package:eastern_dragon/core/di/dependencies.dart';
import 'package:eastern_dragon/features/catalog/presentation/widgets/add_to_cart_bottom_sheet/catalog_element_add_to_cart_bottom_sheet.dart';
import 'package:eastern_dragon/features/catalog/presentation/widgets/catalog_element/catalog_element_widget.dart';
import 'package:eastern_dragon/features/catalog/presentation/widgets/catalog_element/domain/catalog_element_model.dart';
import 'package:eastern_dragon/features/lunch_detail/presentation/lunch_detail_screen.dart';
import 'package:eastern_dragon/features/product_detail/presentation/product_detail_screen.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';

abstract interface class ICatalogElementWM implements IWidgetModel {
  ListenableState<bool> get isLoadingListenable;

  void onElementPressed();
}

CatalogElementWM defaultCatalogElementWMFactory(BuildContext context) {
  return CatalogElementWM(
    CatalogElementModel(
      requestHelper: Dependencies.of(context).requestHelper,
    ),
  );
}

class CatalogElementWM extends WidgetModel<CatalogElementWidget, CatalogElementModel> implements ICatalogElementWM {
  CatalogElementWM(CatalogElementModel model) : super(model);

  late final executor = Dependencies.of(context).executor;

  final _isLoadingState = StateNotifier<bool>(initValue: false);

  @override
  ListenableState<bool> get isLoadingListenable => _isLoadingState;

  @override
  void onElementPressed() {
    if (widget.model.isLunch) {
      loadLunch();
    } else {
      loadProduct();
    }
  }

  Future<void> loadLunch() async {
    showDialog(context: context, builder: (_) => const DefaultLoadingIndicator());
    await executor.execute(
      () => model.loadLunch(widget.model.id),
      onError: (e) {
        Navigator.of(context).pop();
        ToastShower.showError(context, e.title);
      },
      onSuccess: (data) {
        Navigator.of(context).pop();
        BottomSheetShower.showDefaultFlexibleBottomSheet(
          context,
          widget: LunchDetailScreen(
            model: data!,
          ),
          bottomSheet: CatalogElementAddToCartBottomSheet(model: widget.model),
        );
      },
    );
  }

  Future<void> loadProduct() async {
    showDialog(context: context, builder: (_) => const DefaultLoadingIndicator());
    await executor.execute(
      () => model.loadProduct(widget.model.id),
      onError: (e) {
        Navigator.of(context).pop();
        ToastShower.showError(context, e.title);
      },
      onSuccess: (data) {
        Navigator.of(context).pop();
        BottomSheetShower.showDefaultFlexibleBottomSheet(
          context,
          widget: ProductDetailScreen(
            model: data!,
          ),
          bottomSheet: CatalogElementAddToCartBottomSheet(model: widget.model),
        );
      },
    );
  }
}
