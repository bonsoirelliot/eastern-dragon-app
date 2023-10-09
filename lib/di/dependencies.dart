import 'package:eastern_dragon/common/data/models/app_metadata.dart';
import 'package:eastern_dragon/common/domain/services/request_handler.dart';
import 'package:eastern_dragon/di/inherited_dependencies.dart';
import 'package:flutter/material.dart';

/// Dependencies
abstract interface class Dependencies {
  /// Ближайший по дереву объект [Dependencies]
  factory Dependencies.of(BuildContext context) {
    return InheritedDependencies.of(context);
  }

  /// Тут определяем зависимости
  // abstract final SomeDependecy someDependecy;

  /// App metadata.
  abstract final AppMetadata appMetadata;

  /// Отправка запросов.
  abstract final RequestHandler requestHandler;
}

/// Мутабельные зависимости
///
/// Используются в процессе инициализации
final class $MutableDependencies implements Dependencies {
  $MutableDependencies() : context = <String, Object?>{};

  /// Пока не понял, для чего он нужен
  final Map<Object?, Object?> context;

  @override
  late RequestHandler requestHandler;

  @override
  late AppMetadata appMetadata;

  Dependencies freeze() => _$ImmutableDependencies(
        requestHandler: requestHandler,
        appMetadata: appMetadata,
      );
}

/// Иммутабельные
///
/// Ловятся через [InheritedDependencies.of(context)]
final class _$ImmutableDependencies implements Dependencies {
  _$ImmutableDependencies({
    required this.requestHandler,
    required this.appMetadata,
  });

  // @override
  // final SomeDependecy someDependecy;

  @override
  final RequestHandler requestHandler;

  @override
  final AppMetadata appMetadata;
}
