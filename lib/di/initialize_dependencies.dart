import 'dart:async';
import 'dart:io';
import 'package:eastern_dragon/common/data/models/app_metadata.dart';
import 'package:eastern_dragon/common/domain/services/executor.dart';
import 'package:eastern_dragon/common/domain/services/request_handler.dart';
import 'package:eastern_dragon/common/domain/services/request_helper.dart';
import 'package:eastern_dragon/common/domain/user/user_auth_entity.dart';
import 'package:eastern_dragon/di/dependencies.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Инициализирует приложение и возвращает [Dependencies]
Future<Dependencies> $initializeDependencies({
  void Function(int progress, String message)? onProgress,
}) async {
  /// Создаем пустой объект зависимостей
  final dependencies = $MutableDependencies();

  final totalSteps = _initializationSteps.length;

  var currentStep = 0;

  for (final step in _initializationSteps.entries) {
    currentStep++;

    /// Текущий процент выполнения инициализации
    final percent = (currentStep * 100 ~/ totalSteps).clamp(0, 100);
    onProgress?.call(percent, step.key);
    debugPrint(
        'Initialization | $currentStep/$totalSteps ($percent%) | "${step.key}"');

    /// Создаем объект и добавляем его в dependencies
    await step.value(dependencies);
  }

  /// Возвращает инициализированные зависимости
  return dependencies.freeze();
}

/// Метод, который создает объект и добавляет его в dependencies
typedef _InitializationStep = FutureOr<void> Function(
    $MutableDependencies dependencies);

/// <Название шага: метод, создающий зависимость>
final Map<String, _InitializationStep> _initializationSteps =
    <String, _InitializationStep>{
  'Creating app metadata': (dependencies) async {
    final info = await PackageInfo.fromPlatform();

    dependencies.appMetadata = AppMetadata(
      isRelease: kReleaseMode,
      appName: info.appName,
      appVersion: info.version,
      appBuildNumber: info.buildNumber,
      deviceID: await MobileDeviceIdentifier().getDeviceId(),
      systemName: Platform.operatingSystem,
      systemVersion: Platform.operatingSystemVersion,
      processorsCount: Platform.numberOfProcessors,
      appLaunchedDateTime: DateTime.now(),
      locale: Platform.localeName,
      deviceVersion: Platform.version,
      //deviceScreenSize: ScreenUtil.screenSize().representation,
    );
  },
  'Initialize RequestHandler': (dependencies) {
    dependencies.requestHandler = RequestHandler(
      metadata: dependencies.appMetadata,
    );
  },
  'Initialize RequestHelper': (dependencies) {
    dependencies.requestHelper = RequestHelper(
      requestHandler: dependencies.requestHandler,
    );
  },
  'Initialize Executor': (dependencies) {
    dependencies.executor = Executor();
  },
  'Initialize UserAuth': (dependencies) {
    dependencies.userAuthEntity = UserAuthEntity();
  },
  'Initializing analytics': (_) async {/* ... */},
  'Log app open': (_) {},
  'Get remote config': (_) async {/* ... */},
  'Log app initialized': (_) {},
};
