import 'package:eastern_dragon/features/cart/data/cart_item_model.dart';
import 'package:eastern_dragon/features/cart/data/cart_model.dart';

final testCartModel = CartModel(
  items: [
    CartItemModel(
      id: 0,
      name: 'Обед №1',
      description: 'description',
      price: 350,
      quantity: 1,
    ),
    CartItemModel(
      id: 1,
      name: 'Обед №2',
      description: 'description',
      price: 200,
      quantity: 1,
    ),
  ],
  totalPrice: 550,
);
