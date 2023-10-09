import 'package:eastern_dragon/sections/auth/presentation/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final mainNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    initialLocation: '/',
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const AuthScreen(),
      ),
    ],
  );
}
