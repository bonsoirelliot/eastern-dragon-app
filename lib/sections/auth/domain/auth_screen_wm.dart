// ignore_for_file: use_build_context_synchronously

import 'package:eastern_dragon/di/dependencies.dart';
import 'package:eastern_dragon/sections/auth/domain/auth_screen_model.dart';
import 'package:eastern_dragon/sections/auth/presentation/auth_screen.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract interface class IAuthScreenWM implements IWidgetModel {
  /// Состояния
  ListenableState<bool> get isButtonAvailableListenable;

  /// Контроллеры
  TextEditingController get nameController;

  TextEditingController get emailController;

  TextEditingController get codeController;

  PageController get pageController;

  FocusNode get nameFocusNode;

  FocusNode get codeFocusNode;


  /// Методы
  Future<void> trySendEmail();

  Future<void> trySendCode();
}

AuthScreenWM defaultAuthScreenWMFactory(BuildContext context) {
  return AuthScreenWM(AuthScreenModel());
}

class AuthScreenWM extends WidgetModel<AuthScreen, AuthScreenModel>
    implements IAuthScreenWM {
  AuthScreenWM(AuthScreenModel model) : super(model);

  @override
  final nameController = TextEditingController();

  @override
  final emailController = TextEditingController();

  @override
  final codeController = TextEditingController();

  @override
  final pageController = PageController();

  @override
  final nameFocusNode = FocusNode();

  @override
  final codeFocusNode = FocusNode();

  final _isButtonAvailableState = StateNotifier<bool>(initValue: false);

  late final userAuthEntity  = Dependencies.of(context).userAuthEntity;

  @override
  ListenableState<bool> get isButtonAvailableListenable =>
      _isButtonAvailableState;

  @override
  void initWidgetModel() {
    nameFocusNode.requestFocus();

    nameController.addListener(_validator);
    emailController.addListener(_validator);

    super.initWidgetModel();
  }

  @override
  void dispose() {
    nameController.removeListener(_validator);
    emailController.removeListener(_validator);

    super.dispose();
  }

  /// Валидатор для полей
  void _validator() {
    final emailValidator =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    final fieldsAreValid = emailValidator.hasMatch(emailController.text) &&
        nameController.text.length > 1 &&
        nameController.text.length < 20;

    _isButtonAvailableState.accept(fieldsAreValid);
  }

  @override
  Future<void> trySendEmail() async {
    /// Тут типо отправляем email и получаем код

    FocusScope.of(context).requestFocus(FocusNode());

    _isButtonAvailableState.accept(false);

    await Future.delayed(const Duration(seconds: 1));

    _isButtonAvailableState.accept(true);

    pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );

    codeFocusNode.requestFocus();
  }

  @override
  Future<void> trySendCode() async {
    /// Тут типо отправляем код

    await Future.delayed(const Duration(seconds: 1));

    userAuthEntity.setUserAuthState(true);

    context.push('/catalog');
  }
}
