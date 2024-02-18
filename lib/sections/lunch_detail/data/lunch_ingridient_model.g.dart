// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lunch_ingridient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LunchIngridientModel _$LunchIngridientModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'LunchIngridientModel',
      json,
      ($checkedConvert) {
        final val = LunchIngridientModel(
          name: $checkedConvert('name', (v) => v as String),
          options: $checkedConvert(
              'options',
              (v) => (v as List<dynamic>)
                  .map((e) => LunchIngridientOptionModel.fromJson(
                      e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$LunchIngridientModelToJson(
        LunchIngridientModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'options': instance.options,
    };
