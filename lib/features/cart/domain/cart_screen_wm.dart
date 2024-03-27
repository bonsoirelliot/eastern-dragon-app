import 'package:eastern_dragon/core/di/dependencies.dart';
import 'package:eastern_dragon/features/cart/data/cart_model.dart';
import 'package:eastern_dragon/features/cart/domain/cart_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract interface class ICartScreenWM implements IWidgetModel {
  EntityValueListenable<CartModel> get cartListenable;

  Future<void> loadCart();
  void pop();
  void goToCreateOrder();
}

CartScreenWM defaultCartScreenWMFactory(BuildContext context) {
  return CartScreenWM(CartScreenModel());
}

class CartScreenWM extends WidgetModel<ElementaryWidget, CartScreenModel> implements ICartScreenWM {
  CartScreenWM(CartScreenModel model) : super(model);

  late final executor = Dependencies.of(context).executor;

  late final cartRepository = Dependencies.of(context).cartRepository;

  @override
  EntityValueListenable<CartModel> get cartListenable => model.cartState;

  @override
  void initWidgetModel() {
    loadCart();
    super.initWidgetModel();
  }

  @override
  void pop() {
    Navigator.of(context).pop();
  }

  @override
  void goToCreateOrder() {
    context.push('/create_order');
  }

  @override
  Future<void> loadCart() async {
    await executor.execute(
      cartRepository.loadCart,
      before: () => model.cartState.loading(cartRepository.cartListenable.value),
      onSuccess: (_) {
        model.cartState.content(cartRepository.cartListenable.value!);
      },
      onError: model.cartState.error,
    );
  }
}
