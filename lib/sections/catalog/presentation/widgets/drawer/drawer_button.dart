import 'package:eastern_dragon/const/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDrawerButton extends StatelessWidget {
  const CustomDrawerButton({
    required this.icon,
    required this.title,
    this.onPressed,
    this.color,
    super.key,
  });

  final String icon;

  final String title;

  final Color? color;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: 24,
            width: 24,
            color: color,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: AppStyles.caption.copyWith(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
