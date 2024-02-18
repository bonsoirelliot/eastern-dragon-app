import 'package:eastern_dragon/core/const/static/strings.dart';
import 'package:eastern_dragon/core/const/theme/styles.dart';
import 'package:flutter/material.dart';

class DefaultErrorWidget extends StatelessWidget {
  const DefaultErrorWidget({
    required this.title,
    this.subtitle,
    this.onPressed,
    super.key,
  });

  final String title;

  final String? subtitle;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppStyles.h2,
          ),
          if (subtitle?.isNotEmpty ?? false) ...[
            const SizedBox(height: 16),
            Text(
              subtitle!,
              style: AppStyles.caption,
            ),
            if (onPressed != null) ...[
              const SizedBox(height: 16),
              FilledButton(
                onPressed: onPressed,
                child: const Text(
                  Strings.reloadTitle,
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }
}
