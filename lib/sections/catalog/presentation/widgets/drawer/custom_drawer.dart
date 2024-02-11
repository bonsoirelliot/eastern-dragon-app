import 'package:eastern_dragon/common/generated/assets.dart';
import 'package:eastern_dragon/const/static/static_data.dart';
import 'package:eastern_dragon/const/theme/app_colors.dart';
import 'package:eastern_dragon/const/theme/styles.dart';
import 'package:eastern_dragon/di/dependencies.dart';
import 'package:eastern_dragon/sections/catalog/data/drawer_button_model.dart';
import 'package:eastern_dragon/sections/catalog/presentation/widgets/drawer/drawer_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    required this.isSliderOpen,
    this.onDrawerClosed,
    super.key,
  });

  final bool isSliderOpen;

  final VoidCallback? onDrawerClosed;

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapOutside: (_) {
        if (isSliderOpen) {
          onDrawerClosed?.call();
        }
      },
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: StaticData.defaultSidePadding,
            ),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        R.ASSETS_IMAGES_LOGO_PNG,
                        height: 44,
                        width: 44,
                        color: AppColors.red,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Восточная столовая'.toUpperCase(),
                        style: AppStyles.appTitle.copyWith(
                          color: AppColors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 40),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      ...drawerButtons.map(
                        (button) => Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: CustomDrawerButton(
                            icon: button.icon,
                            title: button.title,
                          ),
                        ),
                      ),
                      const Spacer(),
                      CustomDrawerButton(
                        icon: logoutDrawerButton.icon,
                        title: logoutDrawerButton.title,
                        color: AppColors.red,
                        onPressed: () {
                          Dependencies.of(context).userAuthEntity.logout().then(
                                (_) => context.pushReplacement('/welcome'),
                              );
                        },
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
