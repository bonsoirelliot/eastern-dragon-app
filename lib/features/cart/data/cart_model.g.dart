// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'CartModel',
      json,
      ($checkedConvert) {
        final val = CartModel(
          items: $checkedConvert(
              'items',
              (v) => (v as List<dynamic>)
                  .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
          totalPrice: $checkedConvert('totalPrice', (v) => v as num),
        );
        return val;
      },
    );
