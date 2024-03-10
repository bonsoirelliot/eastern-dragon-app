import 'package:eastern_dragon/core/common/presentation/widgets/image_or_svg.dart';
import 'package:eastern_dragon/core/const/theme/app_colors.dart';
import 'package:eastern_dragon/features/catalog/data/catalog_item_model.dart';
import 'package:eastern_dragon/features/catalog/presentation/widgets/catalog_element/catalog_element_info_widget.dart';
import 'package:eastern_dragon/features/catalog/presentation/widgets/catalog_element/domain/catalog_element_wm.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

class CatalogElementWidget extends ElementaryWidget<ICatalogElementWM> {
  const CatalogElementWidget({
    required this.model,
    super.key,
  }) : super(defaultCatalogElementWMFactory);

  final CatalogItemModel model;

  @override
  Widget build(ICatalogElementWM wm) {
    return GestureDetector(
      onTap: wm.onElementPressed,
      child: DecoratedBox(
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
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),

                //* info
                Flexible(
                  child: CatalogElementInfoWidget(
                    model: model,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
