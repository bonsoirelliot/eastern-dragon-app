// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lunch_ingridient_option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LunchIngridientOptionModel _$LunchIngridientOptionModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'LunchIngridientOptionModel',
      json,
      ($checkedConvert) {
        final val = LunchIngridientOptionModel(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          image: $checkedConvert(
              'image',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      ImageNetworkModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );
