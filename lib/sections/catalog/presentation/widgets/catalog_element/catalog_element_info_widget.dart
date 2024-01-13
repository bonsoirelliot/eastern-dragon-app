import 'package:eastern_dragon/const/theme/styles.dart';
import 'package:eastern_dragon/const/theme/theme_constants/button_constants.dart';
import 'package:eastern_dragon/const/theme/theme_constants/filled_button_color_constants.dart';
import 'package:flutter/material.dart';

class CatalogElementInfoWidget extends StatelessWidget {
  const CatalogElementInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Обед №1',
              style: AppStyles.h2,
            ),
            SizedBox(height: 4),
            Text(
              'Рис, 2 горячих, 2 салата',
              style: AppStyles.caption,
            ),
            SizedBox(height: 4),
          ],
        ),
        Row(
          children: [
            const Flexible(
              child: Text(
                '200 гр / 200 гр / 200 гр',
                style: AppStyles.caption,
              ),
            ),
            const SizedBox(width: 12),
            FilledButton(
              style: Theme.of(context).filledButtonTheme.style?.copyWith(
                    shape: SquareButtonShape(),
                    padding: SquareFilledButtonPadding(),
                  ),
              onPressed: () {},
              child: const Text(
                'от 350 ₽',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
