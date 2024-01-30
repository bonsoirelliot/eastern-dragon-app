import 'package:eastern_dragon/common/presentation/widgets/input_field/input_field.dart';
import 'package:eastern_dragon/sections/catalog/data/catalog_section_model.dart';
import 'package:eastern_dragon/sections/catalog/presentation/widgets/catalog_section/catalog_section_widget.dart';
import 'package:eastern_dragon/sections/catalog/presentation/widgets/horizontal_filter/catalog_horizontal_filter.dart';
import 'package:flutter/material.dart';

class CatalogScreenLoadedBody extends StatelessWidget {
  const CatalogScreenLoadedBody({
    required this.models,
    this.onLogoutPressed,
    super.key,
  });

  final List<CatalogSectionModel> models;

  final VoidCallback? onLogoutPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(top: 12, bottom: 16),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  const Expanded(
                    child: InputField(
                      hintText: 'Поиск',
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // TODO(Nikita): theme
                  IconButton(
                    onPressed: onLogoutPressed,
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CatalogHorizontalFilter(
              items: models.map((e) => e.name).toList(),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          ),
          ...models.map(
            (section) => CatalogSectionWidget(
              model: section,
            ),
          ),
        ],
      ),
    );
  }
}
