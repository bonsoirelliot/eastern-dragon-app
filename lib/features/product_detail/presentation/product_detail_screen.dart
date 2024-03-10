import 'package:eastern_dragon/features/catalog/data/catalog_item_model.dart';
import 'package:eastern_dragon/features/product_detail/domain/product_detail_screen_wm.dart';
import 'package:eastern_dragon/features/product_detail/presentation/widgets/product_detail_loaded_body.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends ElementaryWidget<IProductDetailScreenWM> {
  const ProductDetailScreen({
    required this.model,
    super.key,
  }) : super(
          defaultProductDetailScreenWMFactory,
        );

  final CatalogItemModel model;

  @override
  Widget build(IProductDetailScreenWM wm) {
    return ProductDetailLoadedBody(
      model: model,
    );
  }
}
