import 'package:eastern_dragon/core/di/dependencies.dart';
import 'package:eastern_dragon/features/lunch_detail/domain/lunch_detail_screen_model.dart';
import 'package:eastern_dragon/features/lunch_detail/presentation/lunch_detail_screen.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

abstract interface class ILunchDetailScreenWM implements IWidgetModel {
  void pop();
}

LunchDetailScreenWM defaultLunchDetailScreenWMFactory(BuildContext context) {
  return LunchDetailScreenWM(
    LunchDetailScreenModel(
      requestHelper: Dependencies.of(context).requestHelper,
    ),
  );
}

class LunchDetailScreenWM extends WidgetModel<LunchDetailScreen, LunchDetailScreenModel>
    implements ILunchDetailScreenWM {
  LunchDetailScreenWM(LunchDetailScreenModel model) : super(model);

  late final executor = Dependencies.of(context).executor;

  @override
  void pop() {
    Navigator.of(context).pop();
  }
}
