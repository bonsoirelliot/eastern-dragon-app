import 'package:eastern_dragon/const/theme/styles.dart';
import 'package:eastern_dragon/sections/catalog/data/catalog_section_model.dart';
import 'package:eastern_dragon/sections/catalog/presentation/widgets/catalog_element/catalog_element_widget.dart';
import 'package:flutter/material.dart';

class CatalogSectionWidget extends StatelessWidget {
  const CatalogSectionWidget({
    required this.model,
    super.key,
  });

  final CatalogSectionModel model;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 16),
          sliver: SliverToBoxAdapter(
            child: Text(
              model.name,
              style: AppStyles.h1,
            ),
          ),
        ),
        SliverList.separated(
          itemBuilder: (_, i) => CatalogElementWidget(
            model: model.items[i],
          ),
          separatorBuilder: (_, i) => const SizedBox(height: 12),
          itemCount: model.items.length,
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        ),
      ],
    );
  }
}
