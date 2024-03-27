import 'package:eastern_dragon/core/const/theme/light_theme.dart';
import 'package:eastern_dragon/core/di/dependencies.dart';
import 'package:eastern_dragon/core/di/inherited_dependencies.dart';
import 'package:eastern_dragon/core/router/router.dart';
import 'package:eastern_dragon/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
        theme: appTheme,
        routerConfig: AppRouter.router,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        builder: (_, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: ResponsiveScaledBox(
              width: 375,
              child: child!,
            ),
          );
        },
      ),
    );
  }
}
