// ignore_for_file: depend_on_referenced_packages

import 'package:eastern_dragon/common/data/exceptions/response_parse_exception.dart';
import 'package:json_annotation/json_annotation.dart';

part 'catalog_item_model.g.dart';

@JsonSerializable()
class CatalogItemModel {
  final int id;

  final String name;

  final String compound;

  final String weights;

  final String? image;

  final num price;

  CatalogItemModel({
    required this.id,
    required this.name,
    required this.compound,
    required this.weights,
    required this.price,
    this.image,
  });

  factory CatalogItemModel.fromJson(Map<String, dynamic> json) {
    try {
      return _$CatalogItemModelFromJson(json);
    } on Object catch (e) {
      throw ResponseParseException('CatalogItemModel: $e');
    }
  }
}
