import 'package:eastern_dragon/const/theme/light_theme.dart';
import 'package:eastern_dragon/di/dependencies.dart';
import 'package:eastern_dragon/di/inherited_dependencies.dart';
import 'package:eastern_dragon/router/router.dart';
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
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: ResponsiveScaledBox(
              width: 375,
              child: Theme(
                data: lightTheme,
                child: child!,
              ),
            ),
          );
        },
      ),
    );
  }
}