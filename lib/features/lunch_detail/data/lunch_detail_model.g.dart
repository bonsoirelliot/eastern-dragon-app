// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lunch_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LunchDetailModel _$LunchDetailModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LunchDetailModel',
      json,
      ($checkedConvert) {
        final val = LunchDetailModel(
          name: $checkedConvert('name', (v) => v as String),
          ingredients: $checkedConvert(
              'ingredients',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      LunchIngridientModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$LunchDetailModelToJson(LunchDetailModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'ingredients': instance.ingredients,
    };
