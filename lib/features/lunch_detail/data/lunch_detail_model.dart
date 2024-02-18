import 'package:eastern_dragon/core/common/data/exceptions/response_parse_exception.dart';
import 'package:eastern_dragon/features/lunch_detail/data/lunch_ingridient_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lunch_detail_model.g.dart';

@JsonSerializable()
class LunchDetailModel {
  final String name;

  final List<LunchIngridientModel> ingredients;

  LunchDetailModel({
    required this.name,
    required this.ingredients,
  });

  factory LunchDetailModel.fromJson(Map<String, dynamic> json) {
    try {
      return _$LunchDetailModelFromJson(json);
    } on Object catch (e) {
      throw ResponseParseException('LunchDetailModel: $e');
    }
  }
}
