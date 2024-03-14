import 'package:eastern_dragon/core/di/dependencies.dart';
import 'package:eastern_dragon/features/cart/data/cart_model.dart';
import 'package:eastern_dragon/features/cart/domain/cart_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';

abstract interface class ICartScreenWM implements IWidgetModel {
  EntityValueListenable<CartModel> get cartListenable;

  Future<void> loadCart();
  void pop();
}

CartScreenWM defaultCartScreenWMFactory(BuildContext context) {
  return CartScreenWM(
    CartScreenModel(requestHelper: Dependencies.of(context).requestHelper),
  );
}

class CartScreenWM extends WidgetModel<ElementaryWidget, CartScreenModel> implements ICartScreenWM {
  CartScreenWM(CartScreenModel model) : super(model);

  late final executor = Dependencies.of(context).executor;

  ///
  final _cartState = EntityStateNotifier<CartModel>();

  @override
  EntityValueListenable<CartModel> get cartListenable => _cartState;

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
  Future<void> loadCart() async {
    await executor.execute(
      model.loadCart,
      before: _cartState.loading,
      onSuccess: (data) {
        _cartState.content(data!);
      },
      onError: _cartState.error,
    );
  }
}
