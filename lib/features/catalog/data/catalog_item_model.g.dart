// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatalogItemModel _$CatalogItemModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CatalogItemModel',
      json,
      ($checkedConvert) {
        final val = CatalogItemModel(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          compound: $checkedConvert('compound', (v) => v as String),
          weights: $checkedConvert('weights', (v) => v as String),
          price: $checkedConvert('price', (v) => v as String),
          isLunch: $checkedConvert('isLunch', (v) => v as bool),
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

Map<String, dynamic> _$CatalogItemModelToJson(CatalogItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'compound': instance.compound,
      'weights': instance.weights,
      'image': instance.image,
      'price': instance.price,
      'isLunch': instance.isLunch,
    };
