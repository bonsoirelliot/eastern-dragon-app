import 'package:eastern_dragon/core/const/theme/app_colors.dart';
import 'package:eastern_dragon/core/const/theme/styles.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    required this.text,
    required this.isSelected,
    this.onPressed,
    super.key,
  });

  final String text;

  final bool isSelected;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final currentColor = isSelected ? AppColors.red : AppColors.lightGray;

    return Material(
      borderRadius: BorderRadius.circular(20),
      color: currentColor,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        overlayColor: MaterialStateColor.resolveWith(
          (states) => currentColor.withRed(200),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 6, 12, 8),
          child: Text(
            text,
            style: AppStyles.caption.copyWith(
              color: isSelected ? Colors.white : AppColors.darkGray,
            ),
          ),
        ),
      ),
    );
  }
}
