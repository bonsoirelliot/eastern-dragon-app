import 'package:eastern_dragon/core/di/dependencies.dart';
import 'package:eastern_dragon/features/product_detail/domain/product_detail_screen_model.dart';
import 'package:eastern_dragon/features/product_detail/presentation/product_detail_screen.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

abstract interface class IProductDetailScreenWM implements IWidgetModel {
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

  @override
  void pop() {
    Navigator.of(context).pop();
  }
}
