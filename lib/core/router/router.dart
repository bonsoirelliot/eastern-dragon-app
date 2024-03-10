import 'package:eastern_dragon/core/const/static/route_names.dart';
import 'package:eastern_dragon/core/router/redirects.dart';
import 'package:eastern_dragon/features/auth/presentation/auth_screen.dart';
import 'package:eastern_dragon/features/catalog/presentation/catalog_screen.dart';
import 'package:eastern_dragon/features/user_data/presentation/user_data_screen.dart';
import 'package:eastern_dragon/features/welcome/presentation/redirect_screen.dart';
import 'package:eastern_dragon/features/welcome/presentation/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final mainNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    initialLocation: RouteNames.welcomeRoute,
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: RouteNames.welcomeRoute,
        builder: (_, __) => const WelcomeScreen(),
      ),
      GoRoute(
        path: RouteNames.redirectRoute,
        builder: (_, __) => const RedirectScreen(),
        redirect: authRedirect,
      ),
      GoRoute(
        path: RouteNames.authRoute,
        builder: (_, __) => const AuthScreen(),
        redirect: authRedirect,
      ),
      GoRoute(
        path: RouteNames.userDataRoute,
        builder: (_, __) => const UserDataScreen(),
        redirect: authRedirect,
      ),
      GoRoute(
        path: RouteNames.catalogRoute,
        builder: (_, __) => const CatalogScreen(),
      ),
    ],
  );
}