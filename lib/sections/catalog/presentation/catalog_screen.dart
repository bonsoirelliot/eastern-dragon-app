import 'package:eastern_dragon/common/presentation/widgets/input_field/input_field.dart';
import 'package:eastern_dragon/sections/catalog/presentation/widgets/catalog_section/catalog_section_widget.dart';
import 'package:eastern_dragon/sections/catalog/presentation/widgets/horizontal_filter/catalog_horizontal_filter.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(top: 12, bottom: 16),
                sliver: SliverToBoxAdapter(
                  child: InputField(
                    hintText: 'Поиск',
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CatalogHorizontalFilter(
                  items: [
                    'Обеды',
                    'Готовые блюда',
                    'Напитки',
                    'Магазин',
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 24,
                ),
              ),
              CatalogSectionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
