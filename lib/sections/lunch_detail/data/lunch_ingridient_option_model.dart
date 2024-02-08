import 'package:eastern_dragon/common/data/exceptions/response_parse_exception.dart';
import 'package:eastern_dragon/common/data/models/image/image_network_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lunch_ingridient_option_model.g.dart';

@JsonSerializable()
class LunchIngridientOptionModel {
  final int id;

  final String name;

  final List<ImageNetworkModel>? image;

  String? get previewImage => (image?.isNotEmpty ?? false) ? image!.first.src : null;

  LunchIngridientOptionModel({
    required this.id,
    required this.name,
    this.image,
  });

  factory LunchIngridientOptionModel.fromJson(Map<String, dynamic> json) {
    try {
      return _$LunchIngridientOptionModelFromJson(json);
    } on Object catch (e) {
      throw ResponseParseException('LunchIngridientOptionModel: $e');
    }
  }
}
