import 'package:eastern_dragon/core/common/presentation/widgets/default_loading_indicator.dart';
import 'package:eastern_dragon/features/welcome/domain/welcome_screen_wm.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends ElementaryWidget<IWelcomeScreenWM> {
  const WelcomeScreen({super.key})
      : super(
          defaultWelcomeScreenWMFactory,
        );

  @override
  Widget build(IWelcomeScreenWM wm) {
    return const Scaffold(
      body: DefaultLoadingIndicator(),
    );
  }
}
