import 'package:eastern_dragon/core/const/theme/app_colors.dart';
import 'package:eastern_dragon/core/const/theme/styles.dart';
import 'package:flutter/material.dart';

/// Кнопки удаления/добавления товара для боттом шитов
class BottomSheetPlusMinusButtons extends StatelessWidget {
  const BottomSheetPlusMinusButtons({
    required this.onMinusPressed,
    required this.onPlusPressed,
    required this.quantity,
    super.key,
  });

  final VoidCallback onMinusPressed;

  final VoidCallback onPlusPressed;

  final int quantity;

  @override
  Widget build(BuildContext context) {
    final offset = Tween<Offset>(
      begin: const Offset(0, 1.5),
      end: const Offset(0, 0),
    );

    return Container(
      constraints: const BoxConstraints(minWidth: 114),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.grayD9,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _Button(
            onPressed: quantity < 2 ? null : onMinusPressed,
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: offset.animate(animation),
                  child: child,
                ),
              );
            },
            child: Text(
              '$quantity',
              style: AppStyles.button.copyWith(
                color: AppColors.black,
              ),
              key: ValueKey<int>(quantity),
            ),
          ),
          _Button(
            isMinus: false,
            onPressed: onPlusPressed,
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    this.onPressed,
    this.isMinus = true,
    super.key,
  });

  final bool isMinus;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    const minusRadius = BorderRadius.only(
      topLeft: Radius.circular(16),
      bottomLeft: Radius.circular(16),
    );

    const plusRadius = BorderRadius.only(
      topRight: Radius.circular(16),
      bottomRight: Radius.circular(16),
    );

    return SizedBox(
      height: 44,
      child: Material(
        borderRadius: isMinus ? minusRadius : plusRadius,
        color: Colors.transparent,
        child: InkWell(
          borderRadius: isMinus ? minusRadius : plusRadius,
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              isMinus ? Icons.remove : Icons.add,
              color: onPressed != null ? AppColors.black : AppColors.lightGray,
            ),
          ),
        ),
      ),
    );
  }
}
