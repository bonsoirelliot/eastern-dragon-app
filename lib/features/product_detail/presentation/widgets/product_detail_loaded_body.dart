import 'package:eastern_dragon/core/common/presentation/widgets/image_or_svg.dart';
import 'package:eastern_dragon/core/const/static/static_data.dart';
import 'package:eastern_dragon/core/const/theme/styles.dart';
import 'package:eastern_dragon/features/catalog/data/catalog_item_model.dart';
import 'package:flutter/material.dart';

class ProductDetailLoadedBody extends StatelessWidget {
  const ProductDetailLoadedBody({
    required this.model,
    super.key,
  });

  final CatalogItemModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (model.previewImage != null) ...[
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(
              StaticData.defaultCircularRadius,
            ),
            child: ImageOrSvg(model.previewImage),
          ),
        ],
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name,
                style: AppStyles.h1,
              ),
              const SizedBox(height: 8),
              const Text(
                'Тут какое-то описание товара',
                style: AppStyles.caption,
              ),
            ],
          ),
        ),
        const SizedBox(height: 148),
      ],
    );
  }
}
