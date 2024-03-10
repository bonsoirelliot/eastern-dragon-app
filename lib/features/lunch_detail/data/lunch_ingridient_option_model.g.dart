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
          extraPrice: $checkedConvert('extra_price', (v) => v as num),
          image: $checkedConvert('image', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'extraPrice': 'extra_price'},
    );
