import 'package:eastern_dragon/core/const/static/static_data.dart';
import 'package:eastern_dragon/features/catalog/presentation/widgets/horizontal_filter/filter_button.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class CatalogHorizontalFilter extends StatelessWidget {
  const CatalogHorizontalFilter({
    required this.items,
    required this.controller,
    required this.onItemPressed,
    required this.selectedIndex,
    super.key,
  });

  final List<String> items;

  final AutoScrollController controller;

  final void Function(int)? onItemPressed;

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.separated(
        controller: controller,
        padding: const EdgeInsets.symmetric(
          horizontal: StaticData.defaultSidePadding,
        ),
        itemBuilder: (_, i) => AutoScrollTag(
          key: ValueKey(i),
          index: i,
          controller: controller,
          child: FilterButton(
            text: items[i],
            isSelected: i == selectedIndex,
            onPressed: () => onItemPressed?.call(i),
          ),
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
