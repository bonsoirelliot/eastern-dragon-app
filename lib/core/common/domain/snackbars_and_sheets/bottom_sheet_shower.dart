import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';

class BottomSheetShower {
  static showDefaultFlexibleBottomSheet(
    BuildContext context, {
    required Widget Function(BuildContext, ScrollController, double) builder,
  }) {
    showFlexibleBottomSheet(
      context: context,
      maxHeight: .95,
      initHeight: .95,
      isSafeArea: true,
      duration: const Duration(milliseconds: 200),
      anchors: [.95],
      bottomSheetBorderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      builder: builder,
    );
  }
}
