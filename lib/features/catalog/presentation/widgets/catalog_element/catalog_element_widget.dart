import 'package:eastern_dragon/core/common/domain/snackbars_and_sheets/bottom_sheet_shower.dart';
import 'package:eastern_dragon/core/common/presentation/widgets/image_or_svg.dart';
import 'package:eastern_dragon/core/const/theme/app_colors.dart';
import 'package:eastern_dragon/features/catalog/data/catalog_item_model.dart';
import 'package:eastern_dragon/features/catalog/presentation/widgets/catalog_element/catalog_element_info_widget.dart';
import 'package:eastern_dragon/features/catalog/presentation/widgets/add_to_cart_bottom_sheet/catalog_element_add_to_cart_bottom_sheet.dart';
import 'package:eastern_dragon/features/lunch_detail/presentation/lunch_detail_screen.dart';
import 'package:eastern_dragon/features/product_detail/presentation/product_detail_screen.dart';
import 'package:flutter/material.dart';

class CatalogElementWidget extends StatelessWidget {
  const CatalogElementWidget({
    required this.model,
    super.key,
  });

  final CatalogItemModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BottomSheetShower.showDefaultFlexibleBottomSheet(
          context,
          widget: model.isLunch
              ? LunchDetailScreen(
                  id: model.id,
                )
              : ProductDetailScreen(
                  id: model.id,
                ),
          bottomSheet: CatalogElementAddToCartBottomSheet(model: model),
        );
      },
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
                    model.previewImage,
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
