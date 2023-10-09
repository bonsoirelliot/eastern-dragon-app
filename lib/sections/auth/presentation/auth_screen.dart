import 'package:eastern_dragon/const/static/static_data.dart';
import 'package:eastern_dragon/const/theme/app_colors.dart';
import 'package:eastern_dragon/const/theme/styles.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.4, 0.9],
            colors: [
              AppColors.black,
              Color(0xFF721d12),
            ],
          ),
        ),
        child: Padding(
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    _FakeTextField(),
                    SizedBox(
                      height: 12,
                    ),
                    _FakeTextField(),
                  ],
                ),
              ),
              FilledButton(
                onPressed: () {},
                child: const Text('Продолжить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// TODO(bonsoirelliot): добавить CustomTextField
class _FakeTextField extends StatelessWidget {
  const _FakeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.gray,
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Имя',
              style: AppStyles.body,
            ),
          ),
        ),
      ),
    );
  }
}
