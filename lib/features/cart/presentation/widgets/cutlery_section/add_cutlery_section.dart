import 'package:eastern_dragon/core/const/theme/styles.dart';
import 'package:eastern_dragon/features/cart/presentation/widgets/cutlery_section/cutlery_plus_minus_button.dart';
import 'package:flutter/material.dart';

/// Секция "Добавить приборы"
class CartAddCutlerySection extends StatelessWidget {
  const CartAddCutlerySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Добавить приборы',
          style: AppStyles.h3.copyWith(fontWeight: FontWeight.w400),
        ),
        CutleryPlusMinusButton(
          quantity: 1,
          onMinusPressed: () {},
          onPlusPressed: () {},
        ),
      ],
    );
  }
}
