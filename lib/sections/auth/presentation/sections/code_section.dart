import 'package:eastern_dragon/const/static/static_data.dart';
import 'package:eastern_dragon/const/theme/app_colors.dart';
import 'package:eastern_dragon/const/theme/styles.dart';
import 'package:eastern_dragon/sections/auth/domain/auth_screen_wm.dart';
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
    return WillPopScope(
      onWillPop: () async {
        wm.animateToPage(0);
        return false;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: StaticData.defaultSidePadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Верификация аккаунта',
              style: AppStyles.h1,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Введите 4-значный код из письма, которое пришло вам на почту',
              style: AppStyles.caption2,
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Pinput(
                focusNode: wm.codeFocusNode,
                length: 4,
                separatorBuilder: (_) => const SizedBox(
                  width: 18,
                ),
                showCursor: false,
                defaultPinTheme: _pinTheme,
                focusedPinTheme: _pinTheme,
                disabledPinTheme: _inactivePinTheme,
                submittedPinTheme: _pinTheme,
                followingPinTheme: _inactivePinTheme,
                errorPinTheme: _inactivePinTheme,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const _pinTheme = PinTheme(
  width: 30,
  height: 50,
  textStyle: AppStyles.h2,
  decoration: BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: Colors.white,
        width: 2,
      ),
    ),
  ),
);

const _inactivePinTheme = PinTheme(
  width: 30,
  height: 50,
  textStyle: AppStyles.h2,
  decoration: BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: AppColors.gray,
        width: 2,
      ),
    ),
  ),
);
