import 'package:eastern_dragon/core/const/theme/app_colors.dart';
import 'package:flutter/material.dart';

class IconButtonIconSize extends MaterialStateProperty<double> {
  @override
  double resolve(Set<MaterialState> states) {
    return 24.0;
  }
}

class IconButtonIconColor extends MaterialStateColor {
  IconButtonIconColor() : super(0xFFFFF);

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return Colors.white.withOpacity(.7);
    }

    return Colors.white;
  }
}

class IconButtonColor extends MaterialStateColor {
  IconButtonColor() : super(0xFF7B71DA);

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed) ||
        states.contains(MaterialState.hovered) ||
        states.contains(MaterialState.focused)) {
      return AppColors.gray;
    }

    if (states.contains(MaterialState.error) || states.contains(MaterialState.disabled)) {
      return AppColors.gray.withOpacity(.7);
    }

    return AppColors.gray;
  }
}

class IconButtonShape extends MaterialStateProperty<OutlinedBorder> {
  @override
  OutlinedBorder resolve(Set<MaterialState> states) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    );
  }
}

class IconButtonPadding extends MaterialStateProperty<EdgeInsets> {
  @override
  EdgeInsets resolve(Set<MaterialState> states) {
    return const EdgeInsets.symmetric(horizontal: 10, vertical: 9);
  }
}
