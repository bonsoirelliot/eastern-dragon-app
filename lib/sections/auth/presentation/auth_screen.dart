import 'package:eastern_dragon/sections/auth/domain/auth_screen_wm.dart';
import 'package:eastern_dragon/sections/auth/presentation/sections/auth_code_section.dart';
import 'package:eastern_dragon/sections/auth/presentation/sections/auth_email_section.dart';
import 'package:eastern_dragon/sections/auth/presentation/widgets/auth_screen_background.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

class AuthScreen extends ElementaryWidget<IAuthScreenWM> {
  const AuthScreen({super.key})
      : super(
          defaultAuthScreenWMFactory,
        );

  @override
  Widget build(IAuthScreenWM wm) {
    return Scaffold(
      body: AuthScreenBackground(
        child: PageView(
          controller: wm.pageController,
          clipBehavior: Clip.none,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            AuthEmailSection(wm: wm),
            AuthCodeSection(wm: wm),
          ],
        ),
      ),
    );
  }
}
