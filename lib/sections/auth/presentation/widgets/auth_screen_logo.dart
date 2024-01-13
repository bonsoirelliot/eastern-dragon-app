import 'package:flutter/material.dart';

class AuthScreenLogo extends StatelessWidget {
  const AuthScreenLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 140,
          maxWidth: 140,
        ),
        child: Image.asset(
          'assets/images/logo.png',
        ),
      ),
    );
  }
}
