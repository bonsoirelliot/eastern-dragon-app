import 'package:eastern_dragon/core/common/presentation/widgets/bottom_sheets/default_bottom_sheet_container.dart';
import 'package:eastern_dragon/core/const/static/route_names.dart';
import 'package:eastern_dragon/core/const/theme/styles.dart';
import 'package:eastern_dragon/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoToCartBottomSheet extends StatelessWidget {
  const GoToCartBottomSheet({
    required this.totalPrice,
    super.key,
  });

  final num totalPrice;

  @override
  Widget build(BuildContext context) {
    return DefaultBottomSheetContainer(
      child: FilledButton(
        onPressed: () {
          context.push(RouteNames.cartRoute);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(S.current.to_cart),
            Text(
              '$totalPrice ₽',
              style: AppStyles.button.copyWith(
                color: Colors.white.withOpacity(.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
