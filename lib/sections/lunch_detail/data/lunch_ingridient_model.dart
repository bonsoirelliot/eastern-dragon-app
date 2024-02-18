import 'package:eastern_dragon/common/data/exceptions/response_parse_exception.dart';
import 'package:eastern_dragon/sections/lunch_detail/data/lunch_ingridient_option_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lunch_ingridient_model.g.dart';

@JsonSerializable()
class LunchIngridientModel {
  final String name;

  final List<LunchIngridientOptionModel> options;

  LunchIngridientModel({
    required this.name,
    required this.options,
  });

  factory LunchIngridientModel.fromJson(Map<String, dynamic> json) {
    try {
      return _$LunchIngridientModelFromJson(json);
    } on Object catch (e) {
      throw ResponseParseException('LunchIngridientModel: $e');
    }
  }
}
