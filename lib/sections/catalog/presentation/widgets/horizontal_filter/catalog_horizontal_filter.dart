import 'package:eastern_dragon/sections/catalog/presentation/widgets/horizontal_filter/filter_button.dart';
import 'package:flutter/material.dart';

class CatalogHorizontalFilter extends StatelessWidget {
  const CatalogHorizontalFilter({
    required this.items,
    super.key,
  });

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.separated(
        itemBuilder: (_, i) => FilterButton(
          text: items[i],
          isSelected: i == 0,
        ),
        separatorBuilder: (_, i) => const SizedBox(width: 6),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
