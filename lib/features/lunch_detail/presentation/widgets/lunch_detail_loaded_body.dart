import 'package:eastern_dragon/core/const/theme/styles.dart';
import 'package:eastern_dragon/features/lunch_detail/data/lunch_detail_model.dart';
import 'package:eastern_dragon/features/lunch_detail/presentation/widgets/lunch_ingredient_widget.dart';
import 'package:flutter/material.dart';

class LunchDetailLoadedBody extends StatelessWidget {
  const LunchDetailLoadedBody({
    required this.model,
    super.key,
  });

  final LunchDetailModel model;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(height: 12),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              model.name,
              style: AppStyles.h1,
            ),
          ),
        ),
        SliverList.separated(
          itemBuilder: (_, i) => LunchIngredientWidget(
            model: model.ingredients[i],
          ),
          separatorBuilder: (_, i) => const SizedBox(height: 16),
          itemCount: model.ingredients.length,
        ),
      ],
    );
  }
}
