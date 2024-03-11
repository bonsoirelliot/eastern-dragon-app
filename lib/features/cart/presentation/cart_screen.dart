import 'package:eastern_dragon/core/common/presentation/widgets/bottom_sheets/default_bottom_sheet_container.dart';
import 'package:eastern_dragon/core/const/static/static_data.dart';
import 'package:eastern_dragon/core/const/theme/styles.dart';
import 'package:eastern_dragon/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:eastern_dragon/generated/l10n.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: StaticData.defaultSidePadding,
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    S.current.cart,
                    style: AppStyles.h1,
                  ),
                ),
              ),
              SliverList.separated(
                itemBuilder: (_, i) => const CartItemWidget(),
                separatorBuilder: (_, i) => const SizedBox(height: 12),
                itemCount: 5,
              )
            ],
          ),
        ),
      ),
      bottomSheet: DefaultBottomSheetContainer(
        child: FilledButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.current.go_to_payment),
              Text('530 ₽'),
            ],
          ),
        ),
      ),
    );
  }
}
