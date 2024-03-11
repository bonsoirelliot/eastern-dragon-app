import 'package:eastern_dragon/core/common/presentation/widgets/image_or_svg.dart';
import 'package:eastern_dragon/core/const/static/static_data.dart';
import 'package:eastern_dragon/core/const/theme/app_colors.dart';
import 'package:eastern_dragon/core/const/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(StaticData.defaultCircularRadius),
        color: AppColors.gray
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: const ImageOrSvg(
              'image',
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
                  'Обед №1',
                  style: AppStyles.h2.copyWith(fontSize: 14),
                ),
                SizedBox(height: 2),
                Text(
                  'Жаренный рис, курица в кисло-сладком соусе, свинина с овошами, фрунчоза, грибы',
                  style: AppStyles.caption.copyWith(fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
