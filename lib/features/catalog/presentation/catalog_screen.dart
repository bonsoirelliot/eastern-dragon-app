import 'package:eastern_dragon/core/common/data/exceptions/custom_exception.dart';
import 'package:eastern_dragon/core/common/presentation/widgets/default_error_widget.dart';
import 'package:eastern_dragon/core/common/presentation/widgets/default_loading_indicator.dart';
import 'package:eastern_dragon/core/di/dependencies.dart';
import 'package:eastern_dragon/features/catalog/domain/catalog_screen_wm.dart';
import 'package:eastern_dragon/features/catalog/presentation/widgets/catalog_screen_loaded_body.dart';
import 'package:eastern_dragon/features/catalog/presentation/widgets/drawer/custom_drawer.dart';
import 'package:eastern_dragon/features/catalog/presentation/widgets/go_to_cart_bottom_sheet.dart';
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
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: wm.backgroundColor,
          ),
          child: EntityStateNotifierBuilder(
            listenableEntityState: wm.catalogSectionsListenable,
            errorBuilder: (_, e, __) {
              e as CustomException;
              return DefaultErrorWidget(
                title: e.title,
                subtitle: e.subtitle,
                onPressed: wm.loadCatalog,
              );
            },
            loadingBuilder: (_, __) => const DefaultLoadingIndicator(),
            builder: (_, models) => StateNotifierBuilder<bool>(
              listenableState: wm.isDrawerOpenListenable,
              builder: (_, isDrawerOpen) {
                return IgnorePointer(
                  ignoring: isDrawerOpen!,
                  child: CatalogScreenLoadedBody(
                    models: wm.sectionsWithKey,
                    wm: wm,
                  ),
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: EntityStateNotifierBuilder(
        listenableEntityState: wm.catalogSectionsListenable,
        builder: (_, __) {
          return StateNotifierBuilder(
              listenableState: Dependencies.of(_).cartRepository.cartListenable,
              builder: (_, cart) {
                return (cart?.totalPrice ?? 0) > 0
                    ? GoToCartBottomSheet(
                        totalPrice: cart!.totalPrice,
                      )
                    : const SizedBox();
              });
        },
      ),
    );
  }
}
