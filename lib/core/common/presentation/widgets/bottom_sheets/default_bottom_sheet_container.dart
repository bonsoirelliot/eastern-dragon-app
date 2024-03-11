import 'package:eastern_dragon/core/const/static/static_data.dart';
import 'package:eastern_dragon/core/const/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultBottomSheetContainer extends StatelessWidget {
  const DefaultBottomSheetContainer({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(StaticData.defaultCircularRadius),
          topRight: Radius.circular(StaticData.defaultCircularRadius),
        ),
        color: AppColors.gray,
        boxShadow: [
          BoxShadow(
            offset: Offset.zero,
            blurRadius: 2,
            color: AppColors.darkGray,
          ),
        ],
      ),
      padding: const EdgeInsets.all(StaticData.defaultSidePadding),
      child: child,
    );
  }
}
