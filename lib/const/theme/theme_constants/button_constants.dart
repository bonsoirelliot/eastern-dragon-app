import 'package:eastern_dragon/const/theme/styles.dart';
import 'package:flutter/material.dart';

/// Класс, который отвечает за отступы в кнопке
class ButtonPadding extends MaterialStateProperty<EdgeInsets> {
  @override
  EdgeInsets resolve(Set<MaterialState> states) {
    return const EdgeInsets.symmetric(
      vertical: 12,
      horizontal: 16,
    );
  }
}

class ButtonIconSize extends MaterialStateProperty<double> {
  @override
  double resolve(Set<MaterialState> states) {
    return 19.0;
  }
}

/// класс, задающий размер тени для разных состояний кнопки
class ButtonElevation extends MaterialStateProperty<double> {
  @override
  double resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.hovered)) {
      return 4.0;
    }

    return 0.0;
  }
}

/// класс, задающий оформление текста для разных состояний кнопки
class ButtonTextStyle extends MaterialStateProperty<TextStyle> {
  final textStyle = AppStyles.button;

  @override
  TextStyle resolve(Set<MaterialState> states) {
    return textStyle;
  }
}

/// Класс, который отвечает за минимальный размер кнопки
class MinSize extends MaterialStateProperty<Size> {
  @override
  Size resolve(Set<MaterialState> states) {
    return const Size(0, 0);
  }
}

class ButtonShape extends MaterialStateProperty<OutlinedBorder> {
  @override
  OutlinedBorder resolve(Set<MaterialState> states) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    );
  }
}

class SquareButtonShape extends MaterialStateProperty<OutlinedBorder> {
  @override
  OutlinedBorder resolve(Set<MaterialState> states) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    );
  }
}
