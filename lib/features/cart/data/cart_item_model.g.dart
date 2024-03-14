// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CartItemModel',
      json,
      ($checkedConvert) {
        final val = CartItemModel(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          price: $checkedConvert('price', (v) => v as num),
          quantity: $checkedConvert('quantity', (v) => v as int),
          image: $checkedConvert('image', (v) => v as String?),
        );
        return val;
      },
    );
