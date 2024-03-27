import 'package:eastern_dragon/features/cart/data/cart_model.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';

class CartScreenModel extends ElementaryModel {
  CartScreenModel() : super();

  final cartState = EntityStateNotifier<CartModel>()..loading();

  // Future<CartModel> loadCart() async {
  //   // final data = await requestHelper.getObject(
  //   //   RestConstants.cart,
  //   //   fromJson: CartModel.fromJson,
  //   // );

  //   final data = await Future.delayed(
  //     const Duration(seconds: 1),
  //     () => testCartModel,
  //   );

  //   return data;
  // }
}
