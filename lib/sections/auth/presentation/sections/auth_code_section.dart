import 'package:eastern_dragon/const/theme/styles.dart';
import 'package:eastern_dragon/sections/auth/domain/auth_screen_wm.dart';
import 'package:eastern_dragon/sections/auth/presentation/widgets/pinput/pin_theme.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class AuthCodeSection extends StatelessWidget {
  const AuthCodeSection({
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
        const SizedBox(
          height: 40,
        ),
        const Text(
          'Верификация аккаунта',
          style: AppStyles.h1,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Введите 4-значный код из письма которое пришло вам на почту',
          style: AppStyles.subtitle.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Pinput(
          controller: wm.codeController,
          focusNode: wm.codeFocusNode,
          length: 4,
          autofocus: true,
          separatorBuilder: (i) => const SizedBox(width: 18),
          showCursor: false,
          defaultPinTheme: CustomPinTheme.defaultPinTheme,
          followingPinTheme: CustomPinTheme.followingPinTheme,
          onCompleted: (_) => wm.trySendCode(),
        ),
      ],
    );
  }
}
