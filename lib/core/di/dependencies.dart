import 'package:eastern_dragon/core/common/data/models/app_metadata.dart';
import 'package:eastern_dragon/core/common/domain/services/executor.dart';
import 'package:eastern_dragon/core/common/domain/services/request_handler.dart';
import 'package:eastern_dragon/core/common/domain/services/request_helper.dart';
import 'package:eastern_dragon/core/common/domain/user/user_auth_entity.dart';
import 'package:eastern_dragon/core/di/inherited_dependencies.dart';
import 'package:eastern_dragon/features/cart/domain/cart_repository.dart';
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

  /// Обработка ответов от сервера
  abstract final RequestHelper requestHelper;

  abstract final UserAuthEntity userAuthEntity;

  abstract final Executor executor;

  abstract final CartRepository cartRepository;
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
  late RequestHelper requestHelper;

  @override
  late AppMetadata appMetadata;

  @override
  late UserAuthEntity userAuthEntity;

  @override
  late Executor executor;

  @override
  late CartRepository cartRepository;

  Dependencies freeze() => _$ImmutableDependencies(
        requestHandler: requestHandler,
        appMetadata: appMetadata,
        userAuthEntity: userAuthEntity,
        executor: executor,
        requestHelper: requestHelper,
        cartRepository: cartRepository,
      );
}

/// Иммутабельные
///
/// Ловятся через [InheritedDependencies.of(context)]
final class _$ImmutableDependencies implements Dependencies {
  _$ImmutableDependencies({
    required this.requestHandler,
    required this.appMetadata,
    required this.userAuthEntity,
    required this.executor,
    required this.requestHelper,
    required this.cartRepository,
  });

  // @override
  // final SomeDependecy someDependecy;

  @override
  final RequestHandler requestHandler;

  @override
  final RequestHelper requestHelper;

  @override
  final AppMetadata appMetadata;

  @override
  final UserAuthEntity userAuthEntity;

  @override
  final Executor executor;

  @override
  final CartRepository cartRepository;
}
