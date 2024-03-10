import 'package:eastern_dragon/features/lunch_detail/data/lunch_detail_model.dart';
import 'package:eastern_dragon/features/lunch_detail/domain/lunch_detail_screen_wm.dart';
import 'package:eastern_dragon/features/lunch_detail/presentation/widgets/lunch_detail_loaded_body.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

class LunchDetailScreen extends ElementaryWidget<ILunchDetailScreenWM> {
  const LunchDetailScreen({
    required this.model,
    super.key,
  }) : super(
          defaultLunchDetailScreenWMFactory,
        );

  final LunchDetailModel model;

  @override
  Widget build(ILunchDetailScreenWM wm) {
    return LunchDetailLoadedBody(
      model: model,
    );
  }
}
