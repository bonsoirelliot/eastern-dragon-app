// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_section_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatalogSectionModel _$CatalogSectionModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CatalogSectionModel',
      json,
      ($checkedConvert) {
        final val = CatalogSectionModel(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          items: $checkedConvert(
              'items',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      CatalogItemModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$CatalogSectionModelToJson(
        CatalogSectionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'items': instance.items,
    };
