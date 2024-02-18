// ignore_for_file: depend_on_referenced_packages

import 'package:eastern_dragon/core/common/data/exceptions/response_parse_exception.dart';
import 'package:eastern_dragon/core/common/data/models/image/image_network_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'catalog_item_model.g.dart';

@JsonSerializable()
class CatalogItemModel {
  final int id;

  final String name;

  final String compound;

  final String weights;

  // TODO(Nikita): попросить сделать просто строки
  final List<ImageNetworkModel>? image;

  final String price;

  // TODO(Nikita): сделать нормально
  final bool isLunch;

  String? get previewImage => (image?.isNotEmpty ?? false) ? image!.first.src : null;

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
      map['isLunch'] = (map['name'] as String).toLowerCase().contains('обед');

      return _$CatalogItemModelFromJson(map);
    } on Object catch (e) {
      throw ResponseParseException('CatalogItemModel: $e');
    }
  }
}
