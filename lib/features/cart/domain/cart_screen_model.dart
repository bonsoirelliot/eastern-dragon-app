import 'package:eastern_dragon/core/common/domain/services/request_helper.dart';
import 'package:eastern_dragon/core/const/static/rest_constants.dart';
import 'package:eastern_dragon/features/cart/data/cart_model.dart';
import 'package:eastern_dragon/features/cart/domain/test_cart_model.dart';
import 'package:elementary/elementary.dart';

class CartScreenModel extends ElementaryModel {
  CartScreenModel({
    required this.requestHelper,
  }) : super();

  final RequestHelper requestHelper;

  Future<CartModel> loadCart() async {
    // final data = await requestHelper.getObject(
    //   RestConstants.cart,
    //   fromJson: CartModel.fromJson,
    // );

    final data = await Future.delayed(
      const Duration(seconds: 1),
      () => testCartModel,
    );

    return data;
  }
}
