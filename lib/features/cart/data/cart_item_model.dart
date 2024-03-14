import 'package:eastern_dragon/core/common/data/exceptions/response_parse_exception.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item_model.g.dart';

@JsonSerializable(createToJson: false)
class CartItemModel {
  final int id;

  final String name;

  final String description;

  final String? image;

  final num price;

  final int quantity;

  CartItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    this.image,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    try {
      return _$CartItemModelFromJson(json);
    } on Object catch (e) {
      throw ResponseParseException('CartItemModel: $e');
    }
  }
}
