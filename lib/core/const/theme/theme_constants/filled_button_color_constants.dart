import 'package:eastern_dragon/core/const/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Класс, задающий цвет для разных состояний кнопки
class FilledButtonColor extends MaterialStateColor {
  FilledButtonColor() : super(0xFFFFFFFF);

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed) ||
        states.contains(MaterialState.hovered) ||
        states.contains(MaterialState.focused)) {
      return const Color(0xFFFF4F4F);
    }

    if (states.contains(MaterialState.error) ||
        states.contains(MaterialState.disabled)) {
      return AppColors.red.withOpacity(.7);
    }

    return AppColors.red;
  }
}

/// Класс, задающий цвет для разных состояний иконки внутри кнопки
class FilledButtonIconColor extends MaterialStateColor {
  FilledButtonIconColor() : super(0xFFFFF);

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return Colors.white.withOpacity(.38);
    }

    return Colors.white;
  }
}

class FilledButtonPadding extends MaterialStateProperty<EdgeInsets> {
  @override
  EdgeInsets resolve(Set<MaterialState> states) {
    return const EdgeInsets.fromLTRB(17, 11, 17, 13);
  }
}

class SquareFilledButtonPadding extends MaterialStateProperty<EdgeInsets> {
  @override
  EdgeInsets resolve(Set<MaterialState> states) {
    return const EdgeInsets.fromLTRB(12, 6, 12, 6);
  }
}
