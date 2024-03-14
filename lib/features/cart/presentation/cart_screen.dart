import 'package:eastern_dragon/core/common/data/exceptions/custom_exception.dart';
import 'package:eastern_dragon/core/common/presentation/widgets/bottom_sheets/default_bottom_sheet_container.dart';
import 'package:eastern_dragon/core/common/presentation/widgets/buttons/round_close_icon_button.dart';
import 'package:eastern_dragon/core/common/presentation/widgets/default_error_widget.dart';
import 'package:eastern_dragon/core/common/presentation/widgets/default_loading_indicator.dart';
import 'package:eastern_dragon/core/const/static/static_data.dart';
import 'package:eastern_dragon/core/const/theme/styles.dart';
import 'package:eastern_dragon/features/cart/data/cart_model.dart';
import 'package:eastern_dragon/features/cart/domain/cart_screen_wm.dart';
import 'package:eastern_dragon/features/cart/presentation/widgets/cart_screen_body.dart';
import 'package:eastern_dragon/generated/l10n.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';

class CartScreen extends ElementaryWidget<ICartScreenWM> {
  const CartScreen({
    super.key,
  }) : super(defaultCartScreenWMFactory);

  @override
  Widget build(ICartScreenWM wm) {
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.current.cart,
                        style: AppStyles.h1,
                      ),
                      RoundIconButton(
                        onPressed: wm.pop,
                      ),
                    ],
                  ),
                ),
              ),
              EntityStateNotifierBuilder(
                listenableEntityState: wm.cartListenable,
                loadingBuilder: (_, __) => const SliverFillRemaining(
                  child: DefaultLoadingIndicator(),
                ),
                errorBuilder: (_, e, __) {
                  e as CustomException;
                  return SliverFillRemaining(
                    child: DefaultErrorWidget(
                      title: e.title,
                      subtitle: e.subtitle,
                      onPressed: wm.loadCart,
                    ),
                  );
                },
                builder: (_, cart) => CartScreenBody(cart: cart!),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: EntityStateNotifierBuilder<CartModel>(
        listenableEntityState: wm.cartListenable,
        loadingBuilder: (_, __) => const SizedBox(),
        errorBuilder: (_, __, ___) => const SizedBox(),
        builder: (_, cart) {
          return DefaultBottomSheetContainer(
            child: FilledButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(S.current.go_to_payment),
                  Text('${cart!.totalPrice} ₽'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
