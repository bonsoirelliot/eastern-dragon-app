import 'package:eastern_dragon/common/presentation/widgets/image_or_svg.dart';
import 'package:eastern_dragon/const/theme/app_colors.dart';
import 'package:eastern_dragon/sections/catalog/data/catalog_item_model.dart';
import 'package:eastern_dragon/sections/catalog/presentation/widgets/catalog_element/catalog_element_info_widget.dart';
import 'package:flutter/material.dart';

class CatalogElementWidget extends StatelessWidget {
  const CatalogElementWidget({
    required this.model,
    super.key,
  });

  final CatalogItemModel model;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.gray,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: IntrinsicHeight(
          child: Row(
            children: [
              //* image
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: ImageOrSvg(
                  model.image,
                  width: 124,
                  height: 116,
                ),
              ),
              const SizedBox(width: 8),

              //* info
              const Flexible(
                child: CatalogElementInfoWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
