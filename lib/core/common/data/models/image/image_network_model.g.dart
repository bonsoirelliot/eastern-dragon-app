// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_network_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageNetworkModel _$ImageNetworkModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ImageNetworkModel',
      json,
      ($checkedConvert) {
        final val = ImageNetworkModel(
          src: $checkedConvert('src', (v) => v as String),
          height: $checkedConvert('height', (v) => (v as num?)?.toDouble()),
          width: $checkedConvert('width', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$ImageNetworkModelToJson(ImageNetworkModel instance) =>
    <String, dynamic>{
      'src': instance.src,
      'width': instance.width,
      'height': instance.height,
    };
