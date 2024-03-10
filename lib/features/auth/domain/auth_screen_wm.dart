// ignore_for_file: use_build_context_synchronously

import 'package:eastern_dragon/core/common/domain/snackbars_and_sheets/toast_shower.dart';
import 'package:eastern_dragon/core/di/dependencies.dart';
import 'package:eastern_dragon/features/auth/domain/auth_screen_model.dart';
import 'package:eastern_dragon/features/auth/presentation/auth_screen.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';

abstract interface class IAuthScreenWM implements IWidgetModel {
  /// Состояния кнопки
  ListenableState<bool> get isButtonAvailableListenable;

  /// Контроллеры
  TextEditingController get emailController;

  TextEditingController get codeController;

  PageController get pageController;

  FocusNode get emailFocusNode;

  FocusNode get codeFocusNode;

  /// Отправка запроса на получение кода
  Future<void> trySendEmail();

  /// Отправка кода, получение модели пользователя
  Future<void> trySendCode();
}

AuthScreenWM defaultAuthScreenWMFactory(BuildContext context) {
  return AuthScreenWM(
    AuthScreenModel(
      requestHandler: Dependencies.of(context).requestHandler,
    ),
  );
}

class AuthScreenWM extends WidgetModel<AuthScreen, AuthScreenModel> implements IAuthScreenWM {
  AuthScreenWM(AuthScreenModel model) : super(model);

  @override
  final emailController = TextEditingController();

  @override
  final codeController = TextEditingController();

  @override
  final pageController = PageController();

  @override
  final emailFocusNode = FocusNode();

  @override
  final codeFocusNode = FocusNode();

  final _isButtonAvailableState = StateNotifier<bool>(initValue: false);

  late final userAuthEntity = Dependencies.of(context).userAuthEntity;

  late final executor = Dependencies.of(context).executor;

  @override
  ListenableState<bool> get isButtonAvailableListenable => _isButtonAvailableState;

  @override
  void initWidgetModel() {
    emailFocusNode.requestFocus();

    emailController.addListener(_emailValidator);

    super.initWidgetModel();
  }

  @override
  void dispose() {
    emailController.removeListener(_emailValidator);

    super.dispose();
  }

  /// Валидатор для E-mail
  void _emailValidator() {
    final emailValidator = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    final fieldsAreValid = emailValidator.hasMatch(emailController.text);

    _isButtonAvailableState.accept(fieldsAreValid);
  }

  @override
  Future<void> trySendEmail() async {
    FocusScope.of(context).requestFocus(FocusNode());

    await executor.execute(
      () => model.sendEmailCode(emailController.text),
      before: () => _isButtonAvailableState.accept(false),
      after: () => _isButtonAvailableState.accept(true),
      onSuccess: (data) {
        if (data!) {
          pageController.animateToPage(
            1,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );

          codeFocusNode.requestFocus();
        }
      },
      onError: (e) => ToastShower.showError(context, e.title),
    );
  }

  @override
  Future<void> trySendCode() async {
    await executor.execute(
      () => model.auth(codeController.text),
      before: () => _isButtonAvailableState.accept(false),
      after: () => _isButtonAvailableState.accept(true),
      onSuccess: (user) {
        userAuthEntity.setUserState(user!);
      },
      onError: (e) => ToastShower.showError(context, e.title),
    );
  }
}
