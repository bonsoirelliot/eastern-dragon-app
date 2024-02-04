import 'package:eastern_dragon/sections/catalog/domain/catalog_screen_wm.dart';
import 'package:eastern_dragon/sections/catalog/presentation/widgets/catalog_screen_loaded_body.dart';
import 'package:eastern_dragon/sections/catalog/presentation/widgets/drawer/custom_drawer.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class CatalogScreen extends ElementaryWidget<ICatalogScreenWM> {
  const CatalogScreen({super.key})
      : super(
          defaultCatalogScreenWMFactory,
        );

  @override
  Widget build(ICatalogScreenWM wm) {
    return Scaffold(
      body: SliderDrawer(
        key: wm.sliderKey,
        appBar: null,
        isDraggable: false,
        slider: StateNotifierBuilder<bool>(
          listenableState: wm.isDrawerOpenListenable,
          builder: (_, isDrawerOpen) {
            return CustomDrawer(
              isSliderOpen: isDrawerOpen!,
              onDrawerClosed: wm.toggleDrawer,
            );
          },
        ),
        child: EntityStateNotifierBuilder(
          listenableEntityState: wm.catalogSectionsListenable,
          errorBuilder: (_, e, __) => const SizedBox(),
          loadingBuilder: (_, __) => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          builder: (_, models) => CatalogScreenLoadedBody(
            models: models!,
            onProfilePressed: wm.toggleDrawer,
          ),
        ),
      ),
    );
  }
}
