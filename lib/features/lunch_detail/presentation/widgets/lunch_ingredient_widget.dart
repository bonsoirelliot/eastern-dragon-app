import 'package:eastern_dragon/core/const/theme/styles.dart';
import 'package:eastern_dragon/features/lunch_detail/data/lunch_ingridient_model.dart';
import 'package:eastern_dragon/features/lunch_detail/presentation/widgets/lunch_option_widget.dart';
import 'package:flutter/material.dart';

class LunchIngredientWidget extends StatelessWidget {
  const LunchIngredientWidget({
    required this.model,
    super.key,
  });

  final LunchIngridientModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          model.name,
          style: AppStyles.h4.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: model.options.map((e) => LunchOptionWidget(model: e)).toList(),
          ),
        ),
      ],
    );
  }
}
