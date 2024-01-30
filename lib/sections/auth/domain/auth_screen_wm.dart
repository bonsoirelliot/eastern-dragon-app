// ignore_for_file: use_build_context_synchronously

import 'package:eastern_dragon/common/domain/snackbar_manager/toast_shower.dart';
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
  return AuthScreenWM(
    AuthScreenModel(
      requestHandler: Dependencies.of(context).requestHandler,
    ),
  );
}

class AuthScreenWM extends WidgetModel<AuthScreen, AuthScreenModel> implements IAuthScreenWM {
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

  late final userAuthEntity = Dependencies.of(context).userAuthEntity;

  late final executor = Dependencies.of(context).executor;

  @override
  ListenableState<bool> get isButtonAvailableListenable => _isButtonAvailableState;

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
    final emailValidator = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    final fieldsAreValid = emailValidator.hasMatch(emailController.text) &&
        nameController.text.length > 1 &&
        nameController.text.length < 20;

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
      onSuccess: (id) {
        userAuthEntity.setUserAuthState(id!);

        context.pushReplacement('/catalog');
      },
      onError: (e) => ToastShower.showError(context, e.title),
    );
  }
}
