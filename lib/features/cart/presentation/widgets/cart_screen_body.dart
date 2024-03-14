import 'package:eastern_dragon/features/cart/data/cart_model.dart';
import 'package:eastern_dragon/features/cart/presentation/widgets/cutlery_section/add_cutlery_section.dart';
import 'package:eastern_dragon/features/cart/presentation/widgets/cart_item/cart_item_widget.dart';
import 'package:flutter/material.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({
    required this.cart,
    super.key,
  });

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverList.separated(
          itemBuilder: (_, i) => CartItemWidget(
            model: cart.items[i],
          ),
          separatorBuilder: (_, i) => const SizedBox(height: 12),
          itemCount: cart.items.length,
        ),
        const SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                height: 34,
              ),
              CartAddCutlerySection(),
            ],
          ),
        ),
      ],
    );
  }
}
