// ignore_for_file: depend_on_referenced_packages

import 'package:eastern_dragon/core/common/data/exceptions/response_parse_exception.dart';
import 'package:json_annotation/json_annotation.dart';

part 'catalog_item_model.g.dart';

@JsonSerializable(createToJson: false)
class CatalogItemModel {
  final int id;

  final String name;

  final String compound;

  final List<num> weights;

  final String? image;

  final num price;

  @JsonKey(defaultValue: false)
  final bool isLunch;

  num get totalWeight => weights.reduce((a, b) => a + b);

  CatalogItemModel({
    required this.id,
    required this.name,
    required this.compound,
    required this.weights,
    required this.price,
    required this.isLunch,
    this.image,
  });

  factory CatalogItemModel.fromJson(Map<String, dynamic> json) {
    try {
      final map = Map<String, dynamic>.from(json);
      if (json['weights'] is num) {
        map['weights'] = <num>[json['weights']];
      }

      if (json['price'] is String) {
        map['price'] = num.tryParse(json['price']);
      }

      return _$CatalogItemModelFromJson(map);
    } on Object catch (e) {
      throw ResponseParseException('CatalogItemModel: $e');
    }
  }
}
