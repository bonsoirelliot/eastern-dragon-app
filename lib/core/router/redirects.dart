import 'package:eastern_dragon/core/const/static/route_names.dart';
import 'package:eastern_dragon/core/di/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

String authRedirect(BuildContext context, GoRouterState state) {
  final user = Dependencies.of(context).userAuthEntity.user;

  if (user == null) {
    return RouteNames.authRoute;
  }

  if (user.name == null) {
    return RouteNames.userDataRoute;
  }

  return RouteNames.catalogRoute;
}
