import 'package:eastern_dragon/core/common/presentation/widgets/input_field/input_field.dart';
import 'package:eastern_dragon/core/const/theme/styles.dart';
import 'package:eastern_dragon/features/auth/presentation/widgets/auth_screen_background.dart';
import 'package:eastern_dragon/features/auth/presentation/widgets/auth_screen_logo.dart';
import 'package:eastern_dragon/features/user_data/domain/user_data_screen_wm.dart';
import 'package:eastern_dragon/generated/l10n.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';

/// Экран ввода данных пользователя при регистрации
class UserDataScreen extends ElementaryWidget<IUserDataScreenWM> {
  const UserDataScreen({super.key})
      : super(
          defaultUserDataScreenWMFactory,
        );

  @override
  Widget build(IUserDataScreenWM wm) {
    return Scaffold(
      body: AuthScreenBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AuthScreenLogo(),
            const SizedBox(
              height: 40,
            ),
            Text(
              S.current.nameTitle,
              style: AppStyles.h1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: InputField(
                hintText: S.current.name,
                keyboardType: TextInputType.emailAddress,
                controller: wm.nameController,
                focusNode: wm.nameFocusNode,
              ),
            ),
            StateNotifierBuilder<bool>(
              listenableState: wm.isButtonAvailableListenable,
              builder: (_, isAvailable) {
                return FilledButton(
                  onPressed: isAvailable! ? wm.updateUserName : null,
                  child: Text(S.current.continue_title),
                );
              },
            ),
            const SizedBox(height: 43),
          ],
        ),
      ),
    );
  }
}
