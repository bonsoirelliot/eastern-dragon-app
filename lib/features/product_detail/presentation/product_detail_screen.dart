import 'package:eastern_dragon/core/common/data/exceptions/custom_exception.dart';
import 'package:eastern_dragon/core/common/presentation/widgets/default_error_widget.dart';
import 'package:eastern_dragon/core/common/presentation/widgets/default_loading_indicator.dart';
import 'package:eastern_dragon/core/const/static/static_data.dart';
import 'package:eastern_dragon/features/product_detail/domain/product_detail_screen_wm.dart';
import 'package:eastern_dragon/features/product_detail/presentation/widgets/product_detail_loaded_body.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends ElementaryWidget<IProductDetailScreenWM> {
  const ProductDetailScreen({
    required this.id,
    required this.controller,
    super.key,
  }) : super(
          defaultProductDetailScreenWMFactory,
        );

  final int id;

  final ScrollController controller;

  @override
  Widget build(IProductDetailScreenWM wm) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: StaticData.defaultSidePadding,
        ),
        child: Stack(
          children: [
            CustomScrollView(
              controller: controller,
              slivers: [
                EntityStateNotifierBuilder(
                  listenableEntityState: wm.productDetailListenable,
                  loadingBuilder: (_, __) => const SliverFillRemaining(
                    child: DefaultLoadingIndicator(),
                  ),
                  errorBuilder: (_, e, __) {
                    e as CustomException;
                    return SliverToBoxAdapter(
                      child: DefaultErrorWidget(
                        title: e.title,
                        subtitle: e.subtitle,
                        onPressed: wm.loadData,
                      ),
                    );
                  },
                  builder: (_, model) => ProductDetailLoadedBody(
                    model: model!,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
