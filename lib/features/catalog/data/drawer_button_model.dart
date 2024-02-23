import 'package:eastern_dragon/generated/assets.dart';
import 'package:eastern_dragon/generated/l10n.dart';

class DrawerButtonModel {
  final String icon;

  final String title;

  final String? path;

  DrawerButtonModel({
    required this.icon,
    required this.title,
    this.path,
  });
}

final drawerButtons = [
  DrawerButtonModel(icon: R.ASSETS_ICONS_BASKET_ALT_SVG, title: S.current.orders),
  DrawerButtonModel(icon: R.ASSETS_ICONS_USER_SVG, title: S.current.profile),
  DrawerButtonModel(icon: R.ASSETS_ICONS_BELL_SVG, title: S.current.notifications),
  DrawerButtonModel(icon: R.ASSETS_ICONS_INFO_SVG, title: S.current.about),
];

final logoutDrawerButton = DrawerButtonModel(icon: R.ASSETS_ICONS_SIGN_OUT_SQURE_SVG, title: S.current.exit);
