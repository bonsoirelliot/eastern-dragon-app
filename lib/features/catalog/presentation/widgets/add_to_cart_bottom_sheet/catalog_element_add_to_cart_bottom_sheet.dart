import 'package:eastern_dragon/core/const/static/static_data.dart';
import 'package:eastern_dragon/core/const/theme/app_colors.dart';
import 'package:eastern_dragon/core/const/theme/styles.dart';
import 'package:eastern_dragon/features/catalog/data/catalog_item_model.dart';
import 'package:eastern_dragon/features/catalog/presentation/widgets/add_to_cart_bottom_sheet/plus_minus_buttons.dart';
import 'package:eastern_dragon/generated/l10n.dart';
import 'package:flutter/material.dart';

class CatalogElementAddToCartBottomSheet extends StatefulWidget {
  const CatalogElementAddToCartBottomSheet({
    required this.model,
    super.key,
  });

  final CatalogItemModel model;

  @override
  State<CatalogElementAddToCartBottomSheet> createState() => _CatalogElementAddToCartBottomSheetState();
}

class _CatalogElementAddToCartBottomSheetState extends State<CatalogElementAddToCartBottomSheet> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = AppStyles.body.copyWith(color: Colors.white);
    final weightTextStyle = AppStyles.subtitle.copyWith(color: AppColors.lightGray);

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(StaticData.defaultCircularRadius),
          topRight: Radius.circular(StaticData.defaultCircularRadius),
        ),
        color: AppColors.gray,
      ),
      padding: const EdgeInsets.all(StaticData.defaultSidePadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.model.name,
                style: titleTextStyle,
              ),
              Text(
                '${widget.model.price} ₽',
                style: titleTextStyle,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '${widget.model.weights} г',
            style: weightTextStyle,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              PlusMinusButtons(
                onMinusPressed: () {
                  setState(() {
                    quantity -= 1;
                  });
                },
                onPlusPressed: () {
                  setState(() {
                    quantity += 1;
                  });
                },
                quantity: quantity,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FilledButton(
                  onPressed: () {},
                  child: Text(
                    widget.model.isLunch ? S.of(context).choose_options : S.of(context).add_to_cart,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
