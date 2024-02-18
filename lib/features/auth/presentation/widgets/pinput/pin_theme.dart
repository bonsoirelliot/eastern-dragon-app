import 'package:eastern_dragon/core/const/theme/app_colors.dart';
import 'package:eastern_dragon/core/const/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CustomPinTheme {
  static final defaultPinTheme = PinTheme(
    width: 30,
    height: 50,
    padding: EdgeInsets.zero,
    textStyle: AppStyles.h2.copyWith(
      color: Colors.white,
    ),
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),
    ),
  );

  static final followingPinTheme = PinTheme(
    width: 30,
    height: 50,
    padding: EdgeInsets.zero,
    textStyle: AppStyles.h2.copyWith(
      color: Colors.white,
    ),
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: AppColors.gray,
          width: 2,
        ),
      ),
    ),
  );
}
