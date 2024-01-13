import 'package:eastern_dragon/const/static/static_data.dart';
import 'package:eastern_dragon/const/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AuthScreenBackground extends StatelessWidget {
  const AuthScreenBackground({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
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
        child: child,
      ),
    );
  }
}
