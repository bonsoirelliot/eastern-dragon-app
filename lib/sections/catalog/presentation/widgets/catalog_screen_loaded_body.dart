import 'package:eastern_dragon/sections/catalog/data/catalog_section_with_key_model.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:eastern_dragon/common/generated/assets.dart';
import 'package:eastern_dragon/common/presentation/widgets/input_field/input_field.dart';
import 'package:eastern_dragon/const/static/static_data.dart';
import 'package:eastern_dragon/const/theme/app_colors.dart';
import 'package:eastern_dragon/sections/catalog/domain/catalog_screen_wm.dart';
import 'package:eastern_dragon/sections/catalog/presentation/widgets/catalog_section/catalog_section_widget.dart';
import 'package:eastern_dragon/sections/catalog/presentation/widgets/horizontal_filter/catalog_horizontal_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CatalogScreenLoadedBody extends StatelessWidget {
  const CatalogScreenLoadedBody({
    required this.models,
    required this.wm,
    super.key,
  });

  final List<CatalogSectionWithKeyModel> models;

  final ICatalogScreenWM wm;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: CustomScrollView(
        controller: wm.bodyScrollController,
        slivers: [
          SliverAppBar(
            leading: const SizedBox(),
            backgroundColor: AppColors.black,
            scrolledUnderElevation: 0,
            floating: true,
            toolbarHeight: 72,
            expandedHeight: 72,
            collapsedHeight: 72,
            flexibleSpace: Padding(
              padding: const EdgeInsets.fromLTRB(
                StaticData.defaultSidePadding,
                12,
                StaticData.defaultSidePadding,
                16,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: wm.toggleDrawer,
                    icon: SvgPicture.asset(
                      R.ASSETS_ICONS_USER_SVG,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: InputField(
                      hintText: 'Поиск',
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          StateNotifierBuilder<int>(
            listenableState: wm.selectedSectionListenable,
            builder: (_, selectedIndex) {
              return SliverAppBar(
                toolbarHeight: 38,
                expandedHeight: 38,
                collapsedHeight: 38,
                backgroundColor: AppColors.black,
                scrolledUnderElevation: 0,
                pinned: true,
                flexibleSpace: CatalogHorizontalFilter(
                  items: models.map((e) => e.model.name).toList(),
                  controller: wm.filterScrollController,
                  onItemPressed: wm.scrollToSection,
                  selectedIndex: selectedIndex!,
                ),
              );
            },
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          ...models.map(
            (section) => CatalogSectionWidget(
              model: section.model,
            ),
          ),
        ],
      ),
    );
  }
}
