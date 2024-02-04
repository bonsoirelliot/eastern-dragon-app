import 'package:eastern_dragon/di/dependencies.dart';
import 'package:eastern_dragon/sections/welcome/domain/welcome_screen_model.dart';
import 'package:eastern_dragon/sections/welcome/presentation/pages/welcome_screen.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract interface class IWelcomeScreenWM implements IWidgetModel {}

WelcomeScreenWM defaultWelcomeScreenWMFactory(BuildContext context) {
  return WelcomeScreenWM(WelcomeScreenModel());
}

class WelcomeScreenWM extends WidgetModel<WelcomeScreen, WelcomeScreenModel> implements IWelcomeScreenWM {
  WelcomeScreenWM(WelcomeScreenModel model) : super(model);

  late final userAuthEntity = Dependencies.of(context).userAuthEntity;

  @override
  void initWidgetModel() {
    checkAuthState();
    super.initWidgetModel();
  }

  Future<void> checkAuthState() async {
    await Future.delayed(const Duration(seconds: 1));

    await userAuthEntity.readUserAuthState();

    // ignore: use_build_context_synchronously
    context.pushReplacement(
      userAuthEntity.isAuth ? '/catalog' : '/auth',
    );
  }
}
