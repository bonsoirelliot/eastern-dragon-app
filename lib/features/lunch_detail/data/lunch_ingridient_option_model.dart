import 'package:eastern_dragon/core/common/data/exceptions/response_parse_exception.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lunch_ingridient_option_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class LunchIngridientOptionModel {
  final int id;

  final String name;

  final String? image;

  final num extraPrice;

  LunchIngridientOptionModel({
    required this.id,
    required this.name,
    required this.extraPrice,
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
