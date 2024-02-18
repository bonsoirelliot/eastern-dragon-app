// ignore_for_file: depend_on_referenced_packages

import 'package:eastern_dragon/core/common/data/exceptions/response_parse_exception.dart';
import 'package:eastern_dragon/features/catalog/data/catalog_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'catalog_section_model.g.dart';

@JsonSerializable()
class CatalogSectionModel {
  final int id;

  final String name;

  final List<CatalogItemModel> items;

  CatalogSectionModel({
    required this.id,
    required this.name,
    required this.items,
  });

  factory CatalogSectionModel.fromJson(Map<String, dynamic> json) {
    try {
      return _$CatalogSectionModelFromJson(json);
    } on Object catch (e) {
      throw ResponseParseException('CatalogSectionModel: $e');
    }
  }
}
