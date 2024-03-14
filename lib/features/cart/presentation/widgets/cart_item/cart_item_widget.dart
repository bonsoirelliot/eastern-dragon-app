import 'package:eastern_dragon/core/common/presentation/widgets/image_or_svg.dart';
import 'package:eastern_dragon/core/const/static/static_data.dart';
import 'package:eastern_dragon/core/const/theme/app_colors.dart';
import 'package:eastern_dragon/core/const/theme/styles.dart';
import 'package:eastern_dragon/features/cart/data/cart_item_model.dart';
import 'package:eastern_dragon/features/cart/presentation/widgets/cart_item/plus_minus_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    required this.model,
    super.key,
  });

  final CartItemModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 101,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(StaticData.defaultCircularRadius), color: AppColors.gray),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: ImageOrSvg(
              model.image,
              width: 84,
              height: 77,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: AppStyles.h2.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 2),
                Text(
                  model.description,
                  style: AppStyles.caption.copyWith(fontSize: 10),
                ),
                const SizedBox(height: 6),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PlusMinusButton(
                      quantity: model.quantity,
                      onMinusPressed: () {},
                      onPlusPressed: () {},
                    ),
                    Text(
                      '${model.price} ₽',
                      style: AppStyles.h4,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
