import 'package:eastern_dragon/core/common/data/exceptions/response_parse_exception.dart';
import 'package:eastern_dragon/features/cart/data/cart_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable(createToJson: false)
class CartModel {
  final List<CartItemModel> items;

  final num totalPrice;

  CartModel({
    required this.items,
    required this.totalPrice,
  });

  CartModel.empty()
      : items = [],
        totalPrice = 0;

  factory CartModel.fromJson(Map<String, dynamic> json) {
    try {
      return _$CartModelFromJson(json);
    } on Object catch (e) {
      throw ResponseParseException('CartModel: $e');
    }
  }
}
