import 'package:eastern_dragon/core/di/dependencies.dart';
import 'package:eastern_dragon/features/user_data/domain/user_data_screen_model.dart';
import 'package:eastern_dragon/features/user_data/presentation/user_data_screen.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';

abstract interface class IUserDataScreenWM implements IWidgetModel {
  ListenableState<bool> get isButtonAvailableListenable;

  TextEditingController get nameController;

  FocusNode get nameFocusNode;

  Future<void> updateUserName();
}

UserDataScreenWM defaultUserDataScreenWMFactory(BuildContext context) {
  return UserDataScreenWM(UserDataScreenModel());
}

class UserDataScreenWM extends WidgetModel<UserDataScreen, UserDataScreenModel> implements IUserDataScreenWM {
  UserDataScreenWM(UserDataScreenModel model) : super(model);

  final _isButtonAvailableState = StateNotifier<bool>(initValue: false);

  @override
  ListenableState<bool> get isButtonAvailableListenable => _isButtonAvailableState;

  @override
  final nameController = TextEditingController();

  @override
  final nameFocusNode = FocusNode();

  late final userEntity = Dependencies.of(context).userAuthEntity;

  late final executor = Dependencies.of(context).executor;

  @override
  void initWidgetModel() {
    nameFocusNode.requestFocus();
    nameController.addListener(nameListener);
    super.initWidgetModel();
  }

  @override
  void dispose() {
    nameController.removeListener(nameListener);
    super.dispose();
  }

  @override
  Future<void> updateUserName() async {
    executor.execute(
      () => userEntity.updateUserData(
        name: nameController.text,
      ),
      before: () => _isButtonAvailableState.accept(false),
      after: () => _isButtonAvailableState.accept(true),
    );
  }

  void nameListener() {
    _isButtonAvailableState.accept(nameController.text.length > 2);
  }
}
