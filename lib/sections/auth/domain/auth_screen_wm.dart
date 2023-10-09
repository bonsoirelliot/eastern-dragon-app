import 'package:eastern_dragon/common/domain/services/executor.dart';
import 'package:eastern_dragon/sections/auth/domain/auth_screen_model.dart';
import 'package:eastern_dragon/sections/auth/presentation/auth_screen.dart';
import 'package:elementary/elementary.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

AuthScreenWM defaultAuthScreenWMFactory(BuildContext context) {
  return AuthScreenWM(AuthScreenModel());
}

// TODO(bonsoirelliot): comments
abstract interface class IAuthScreenWM implements IWidgetModel {
  ValueListenable<bool> get isContinueButtonAvailableListenable;

  PageController get pageController;

  TextEditingController get nameController;
  TextEditingController get phoneController;
  TextEditingController get codeController;

  Future<void> requestCall();
  void animateToPage(int page);

  FocusNode get codeFocusNode;
}

class AuthScreenWM extends WidgetModel<AuthScreen, AuthScreenModel>
    implements IAuthScreenWM {
  AuthScreenWM(AuthScreenModel model) : super(model);

  @override
  ValueListenable<bool> get isContinueButtonAvailableListenable =>
      _isContinueButtonAvailableState;

  final _isContinueButtonAvailableState = ValueNotifier<bool>(false);

  @override
  final codeFocusNode = FocusNode();

  @override
  final phoneController = MaskedTextController(
    mask: '+7 (900) 000-00-00',
    cursorBehavior: CursorBehaviour.end,
  );

  @override
  final codeController = TextEditingController();

  @override
  final nameController = TextEditingController();

  @override
  final pageController = PageController();

  @override
  void initWidgetModel() {
    phoneController.addListener(controllersListener);
    nameController.addListener(controllersListener);
    super.initWidgetModel();
  }

  @override
  void dispose() {
    phoneController.removeListener(controllersListener);
    nameController.removeListener(controllersListener);
    super.dispose();
  }

  @override
  void animateToPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  @override
  Future<void> requestCall() async {
    await execute<void>(
      () => Future<void>.delayed(
        const Duration(seconds: 1),
      ),
      before: () {
        _isContinueButtonAvailableState.value = false;
      },
      after: () {
        _isContinueButtonAvailableState.value = true;
      },
      onSuccess: (data) {
        pageController.animateToPage(
          1,
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
        );

        codeFocusNode.requestFocus();
      },
    );
  }

  void controllersListener() {
    _isContinueButtonAvailableState.value = nameValidator() && phoneValidator();
  }

  bool nameValidator() => nameController.text.length > 2;

  bool phoneValidator() => phoneController.text.length >= 18;
}
