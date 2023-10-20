import 'dart:async';

import 'package:eastern_dragon/app.dart';
import 'package:eastern_dragon/di/initialization.dart';
import 'package:flutter/material.dart';

void main() async {
  runZonedGuarded(
    () => $initializeApp(
      onSuccess: (dependencies) => runApp(
        EasternDragonApp(
          dependencies: dependencies,
        ),
      ),
    ),
    (error, stack) {},
  );
}
