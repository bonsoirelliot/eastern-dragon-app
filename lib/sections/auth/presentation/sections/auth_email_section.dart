import 'package:eastern_dragon/common/presentation/widgets/input_field/input_field.dart';
import 'package:eastern_dragon/const/theme/styles.dart';
import 'package:eastern_dragon/sections/auth/domain/auth_screen_wm.dart';
import 'package:eastern_dragon/sections/auth/presentation/widgets/auth_screen_logo.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';

class AuthEmailSection extends StatelessWidget {
  const AuthEmailSection({
    required this.wm,
    super.key,
  });

  final IAuthScreenWM wm;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AuthScreenLogo(),
        const SizedBox(
          height: 40,
        ),
        const Text(
          'Регистрация',
          style: AppStyles.h1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              InputField(
                hintText: 'Имя',
                keyboardType: TextInputType.name,
                controller: wm.nameController,
                focusNode: wm.nameFocusNode,
              ),
              const SizedBox(
                height: 12,
              ),
              InputField(
                hintText: 'E-mail',
                keyboardType: TextInputType.emailAddress,
                controller: wm.emailController,
              ),
            ],
          ),
        ),
        StateNotifierBuilder<bool>(
          listenableState: wm.isButtonAvailableListenable,
          builder: (_, isAvailable) {
            return FilledButton(
              onPressed: isAvailable! ? wm.trySendEmail : null,
              child: const Text('Продолжить'),
            );
          },
        ),
        const SizedBox(height: 43),
      ],
    );
  }
}
