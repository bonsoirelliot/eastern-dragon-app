import 'package:eastern_dragon/common/presentation/widgets/image_or_svg.dart';
import 'package:eastern_dragon/const/static/static_data.dart';
import 'package:eastern_dragon/const/theme/app_colors.dart';
import 'package:eastern_dragon/const/theme/styles.dart';
import 'package:eastern_dragon/const/theme/theme_constants/button_constants.dart';
import 'package:eastern_dragon/const/theme/theme_constants/filled_button_color_constants.dart';
import 'package:eastern_dragon/sections/lunch_detail/data/lunch_ingridient_option_model.dart';
import 'package:flutter/material.dart';

class LunchOptionWidget extends StatelessWidget {
  const LunchOptionWidget({
    required this.model,
    super.key,
  });

  final LunchIngridientOptionModel model;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          StaticData.defaultCircularRadius,
        ),
        color: AppColors.gray,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: ImageOrSvg(
                model.previewImage,
                width: 119,
                height: 113,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              model.name,
              style: AppStyles.subtitle,
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: 119,
              child: FilledButton(
                onPressed: () {},
                style: Theme.of(context).filledButtonTheme.style?.copyWith(
                      shape: SquareButtonShape(),
                      padding: SquareFilledButtonPadding(),
                    ),
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
