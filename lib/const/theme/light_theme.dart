import 'package:eastern_dragon/const/theme/app_colors.dart';
import 'package:eastern_dragon/const/theme/theme_constants/button_constants.dart';
import 'package:eastern_dragon/const/theme/theme_constants/filled_button_color_constants.dart';
import 'package:flutter/material.dart';

final appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.black,
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: FilledButtonColor(),
      textStyle: ButtonTextStyle(),
      padding: FilledButtonPadding(),
      minimumSize: MinSize(),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: ButtonElevation(),
      iconSize: ButtonIconSize(),
      shape: ButtonShape(),
      foregroundColor: FilledButtonIconColor(),
    ),
  ),
);
