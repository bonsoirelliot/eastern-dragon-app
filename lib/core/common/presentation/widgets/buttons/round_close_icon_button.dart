import 'package:eastern_dragon/core/const/theme/app_colors.dart';
import 'package:eastern_dragon/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: Theme.of(context).iconButtonTheme.style?.copyWith(
            padding: const MaterialStatePropertyAll(
              EdgeInsets.all(7),
            ),
            iconSize: const MaterialStatePropertyAll(10),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            backgroundColor: MaterialStateColor.resolveWith(
              (_) => AppColors.grayD9,
            ),
            iconColor: MaterialStateColor.resolveWith(
              (_) => AppColors.black,
            ),
          ),
      icon: SvgPicture.asset(
        R.ASSETS_ICONS_CLOSE_SVG,
      ),
    );
  }
}
