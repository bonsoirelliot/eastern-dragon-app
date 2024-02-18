import 'package:eastern_dragon/core/const/theme/styles.dart';
import 'package:eastern_dragon/core/const/theme/theme_constants/button_constants.dart';
import 'package:eastern_dragon/core/const/theme/theme_constants/filled_button_color_constants.dart';
import 'package:eastern_dragon/features/catalog/data/catalog_item_model.dart';
import 'package:flutter/material.dart';

class CatalogElementInfoWidget extends StatelessWidget {
  const CatalogElementInfoWidget({
    required this.model,
    super.key,
  });

  final CatalogItemModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.name,
              style: AppStyles.h2,
            ),
            const SizedBox(height: 4),
            Text(
              model.compound,
              style: AppStyles.caption,
            ),
            const SizedBox(height: 4),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                model.weights,
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
              child: Text(
                'от ${model.price} ₽',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
