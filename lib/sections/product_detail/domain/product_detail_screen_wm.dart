import 'package:eastern_dragon/di/dependencies.dart';
import 'package:eastern_dragon/sections/catalog/data/catalog_item_model.dart';
import 'package:eastern_dragon/sections/product_detail/domain/product_detail_screen_model.dart';
import 'package:eastern_dragon/sections/product_detail/presentation/product_detail_screen.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';

abstract interface class IProductDetailScreenWM implements IWidgetModel {
  EntityValueListenable<CatalogItemModel> get productDetailListenable;

  Future<void> loadData();
  void pop();
}

ProductDetailScreenWM defaultProductDetailScreenWMFactory(BuildContext context) {
  return ProductDetailScreenWM(
    ProductDetailScreenModel(
      requestHelper: Dependencies.of(context).requestHelper,
    ),
  );
}

class ProductDetailScreenWM extends WidgetModel<ProductDetailScreen, ProductDetailScreenModel>
    implements IProductDetailScreenWM {
  ProductDetailScreenWM(ProductDetailScreenModel model) : super(model);

  late final executor = Dependencies.of(context).executor;

  @override
  EntityValueListenable<CatalogItemModel> get productDetailListenable => _productDetailState;

  final _productDetailState = EntityStateNotifier<CatalogItemModel>();

  @override
  void initWidgetModel() {
    loadData();
    super.initWidgetModel();
  }

  @override
  Future<void> loadData() async {
    await executor.execute(
      () => model.loadData(widget.id),
      before: _productDetailState.loading,
      onError: _productDetailState.error,
      onSuccess: (data) => _productDetailState.content(data!),
    );
  }

  @override
  void pop() {
    Navigator.of(context).pop();
  }
}
