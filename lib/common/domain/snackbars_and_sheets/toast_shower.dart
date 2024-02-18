import 'package:eastern_dragon/const/static/static_data.dart';
import 'package:eastern_dragon/const/theme/app_colors.dart';
import 'package:eastern_dragon/const/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastShower {
  // static final appToast = FToast();

  static void _showToast(BuildContext context, String title, Color backgroundColor) {
    FToast().init(context).showToast(
          gravity: ToastGravity.TOP,
          toastDuration: const Duration(seconds: 3),
          positionedToastBuilder: (context, child) => Positioned(
            top: 56,
            right: 0,
            left: 0,
            child: child,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                StaticData.defaultCircularRadius,
              ),
              color: backgroundColor,
              // boxShadow: const [
              //   BoxShadow(
              //     color: AppColors.shadow,
              //     blurRadius: 2,
              //   )
              // ],
            ),
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 42),
            child: Row(
              children: [
                // SizedBox(
                //   height: 24,
                //   width: 24,
                //   child: Image.asset(
                //     icon,
                //   ),
                // ),
                // const SizedBox(
                //   width: 12,
                // ),
                Flexible(
                  child: Center(
                    child: Text(
                      title,
                      style: AppStyles.body,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  }

  static void showNotification(BuildContext context, String title) {
    _showToast(
      context,
      title,
      AppColors.green,
    );
  }

  static void showError(BuildContext context, String title) {
    _showToast(
      context,
      title,
      AppColors.red,
    );
  }
}
