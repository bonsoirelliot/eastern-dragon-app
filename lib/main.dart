import 'dart:async';

import 'package:eastern_dragon/app.dart';
import 'package:eastern_dragon/core/di/initialization.dart';
import 'package:flutter/material.dart';

void main() {
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
