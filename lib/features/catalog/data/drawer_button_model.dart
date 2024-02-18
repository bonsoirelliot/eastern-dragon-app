import 'package:eastern_dragon/core/common/generated/assets.dart';

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
  DrawerButtonModel(icon: R.ASSETS_ICONS_BASKET_ALT_SVG, title: 'Заказы'),
  DrawerButtonModel(icon: R.ASSETS_ICONS_USER_SVG, title: 'Профиль'),
  DrawerButtonModel(icon: R.ASSETS_ICONS_BELL_SVG, title: 'Уведомления'),
  DrawerButtonModel(icon: R.ASSETS_ICONS_INFO_SVG, title: 'О приложении'),
];

final logoutDrawerButton = DrawerButtonModel(icon: R.ASSETS_ICONS_SIGN_OUT_SQURE_SVG, title: 'Выйти');
