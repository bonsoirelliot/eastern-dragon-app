import 'package:eastern_dragon/di/dependencies.dart';
import 'package:eastern_dragon/sections/lunch_detail/data/lunch_detail_model.dart';
import 'package:eastern_dragon/sections/lunch_detail/domain/lunch_detail_screen_model.dart';
import 'package:eastern_dragon/sections/lunch_detail/presentation/lunch_detail_screen.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';

abstract interface class ILunchDetailScreenWM implements IWidgetModel {
  EntityValueListenable<LunchDetailModel> get lunchDetailListenable;

  Future<void> loadData();

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
  EntityValueListenable<LunchDetailModel> get lunchDetailListenable => _lunchDetailState;

  final _lunchDetailState = EntityStateNotifier<LunchDetailModel>();

  @override
  void initWidgetModel() {
    loadData();
    super.initWidgetModel();
  }

  @override
  void pop() {
    Navigator.of(context).pop();
  }

  @override
  Future<void> loadData() async {
    await executor.execute(
      () => model.loadData(widget.id),
      before: _lunchDetailState.loading,
      onError: _lunchDetailState.error,
      onSuccess: (data) => _lunchDetailState.content(data!),
    );
  }
}
