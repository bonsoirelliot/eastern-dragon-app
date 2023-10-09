import 'package:eastern_dragon/const/theme/app_colors.dart';
import 'package:eastern_dragon/sections/auth/domain/auth_screen_wm.dart';
import 'package:eastern_dragon/sections/auth/presentation/sections/code_section.dart';
import 'package:eastern_dragon/sections/auth/presentation/sections/phone_section.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

class AuthScreen extends ElementaryWidget<IAuthScreenWM> {
  const AuthScreen({
    super.key,
  }) : super(defaultAuthScreenWMFactory);

  @override
  Widget build(IAuthScreenWM wm) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.4, 0.9],
            colors: [
              AppColors.black,
              Color(0xFF721d12),
            ],
          ),
        ),
        child: PageView.builder(
          itemBuilder: (_, i) =>
              i == 0 ? AuthPhoneSection(wm: wm) : AuthCodeSection(wm: wm),
          itemCount: 2,
          physics: const NeverScrollableScrollPhysics(),
          controller: wm.pageController,
        ),
      ),
    );
  }
}
