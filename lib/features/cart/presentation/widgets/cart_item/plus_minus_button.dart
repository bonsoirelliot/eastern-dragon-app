import 'package:eastern_dragon/core/const/theme/app_colors.dart';
import 'package:eastern_dragon/core/const/theme/styles.dart';
import 'package:flutter/material.dart';

class PlusMinusButton extends StatelessWidget {
  const PlusMinusButton({
    required this.quantity,
    required this.onMinusPressed,
    required this.onPlusPressed,
    super.key,
  });

  final int quantity;

  final VoidCallback onMinusPressed;

  final VoidCallback onPlusPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.grayD9,
      ),
      child: Row(
        children: [
          _Button(
            onPressed: () {},
          ),
          const _Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              '$quantity шт',
              style: AppStyles.button.copyWith(
                fontSize: 10,
                color: AppColors.gray,
              ),
            ),
          ),
          const _Divider(),
          _Button(
            onPressed: () {},
            isRemove: false,
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.onPressed,
    this.isRemove = true,
    super.key,
  });

  final bool isRemove;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    const removeRadius = BorderRadius.only(
      topLeft: Radius.circular(20),
      bottomLeft: Radius.circular(20),
    );

    const addRadius = BorderRadius.only(
      topRight: Radius.circular(20),
      bottomRight: Radius.circular(20),
    );

    return Material(
      borderRadius: isRemove ? removeRadius : addRadius,
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: isRemove ? removeRadius : addRadius,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            isRemove ? 6 : 4,
            3,
            isRemove ? 4 : 6,
            3,
          ),
          child: Icon(
            isRemove ? Icons.remove : Icons.add,
            color: AppColors.gray,
            size: 16,
          ),
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFBFBFBF),
      width: .5,
      height: 15,
    );
  }
}
