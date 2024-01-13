import 'package:eastern_dragon/const/theme/styles.dart';
import 'package:eastern_dragon/sections/catalog/presentation/widgets/catalog_element/catalog_element_widget.dart';
import 'package:flutter/material.dart';

class CatalogSectionWidget extends StatelessWidget {
  const CatalogSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        const SliverPadding(
          padding: EdgeInsets.only(bottom: 16),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Обеды',
              style: AppStyles.h1,
            ),
          ),
        ),
        SliverList.separated(
          itemBuilder: (_, i) => const CatalogElementWidget(),
          separatorBuilder: (_, i) => const SizedBox(height: 12),
          itemCount: 10,
        ),
      ],
    );
  }
}
