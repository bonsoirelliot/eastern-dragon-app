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
          image: $checkedConvert('image', (v) => v as String?),
        );
        return val;
      },
    );
