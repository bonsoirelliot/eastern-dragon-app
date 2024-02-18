import 'package:eastern_dragon/features/auth/presentation/auth_screen.dart';
import 'package:eastern_dragon/features/catalog/presentation/catalog_screen.dart';
import 'package:eastern_dragon/features/welcome/presentation/pages/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final mainNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    initialLocation: '/welcome',
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: '/welcome',
        builder: (_, __) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/auth',
        builder: (_, __) => const AuthScreen(),
      ),
      GoRoute(
        path: '/catalog',
        builder: (_, __) => const CatalogScreen(),
      ),
    ],
  );
}
