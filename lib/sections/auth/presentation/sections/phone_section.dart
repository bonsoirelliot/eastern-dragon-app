import 'package:eastern_dragon/common/presentation/widgets/custom_text_field/custom_text_field.dart';
import 'package:eastern_dragon/const/static/static_data.dart';
import 'package:eastern_dragon/const/theme/styles.dart';
import 'package:eastern_dragon/sections/auth/domain/auth_screen_wm.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class AuthPhoneSection extends StatelessWidget {
  const AuthPhoneSection({
    required this.wm,
    super.key,
  });

  final IAuthScreenWM wm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: StaticData.defaultSidePadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 140,
                maxWidth: 140,
              ),
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
          ),
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
                CustomTextField(
                  hintText: 'Имя',
                  controller: wm.nameController,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextField(
                  hintText: 'Номер телефона',
                  controller: wm.phoneController,
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
              valueListenable: wm.isContinueButtonAvailableListenable,
              builder: (_, isAvailable, __) {
                return FilledButton(
                  onPressed: isAvailable ? wm.requestCall : null,
                  child: const Text('Продолжить'),
                );
              }),
          const SizedBox(
            height: 40,
          ),
          FilledButton(
            onPressed: () {
              FirebaseAnalytics.instance.logEvent(
                name: 'bloc_create',
                parameters: {
                  'screen': '123',
                },
              );
            },
            child: const Text('Продолжить'),
          )
        ],
      ),
    );
  }
}
