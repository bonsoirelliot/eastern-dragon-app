import 'package:eastern_dragon/core/const/theme/light_theme.dart';
import 'package:eastern_dragon/core/di/dependencies.dart';
import 'package:eastern_dragon/core/di/inherited_dependencies.dart';
import 'package:eastern_dragon/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class EasternDragonApp extends StatelessWidget {
  const EasternDragonApp({
    required this.dependencies,
    super.key,
  });

  final Dependencies dependencies;

  @override
  Widget build(BuildContext context) {
    return InheritedDependencies(
      dependencies: dependencies,
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        builder: (_, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: ResponsiveScaledBox(
              width: 375,
              child: Theme(
                data: appTheme,
                child: child!,
              ),
            ),
          );
        },
      ),
    );
  }
}
