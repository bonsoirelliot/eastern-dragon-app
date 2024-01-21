// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseModel _$BaseResponseModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BaseResponseModel',
      json,
      ($checkedConvert) {
        final val = BaseResponseModel(
          data: $checkedConvert('data', (v) => v),
          success: $checkedConvert('success', (v) => v as bool),
          code: $checkedConvert('code', (v) => v as int?),
          message: $checkedConvert('message', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$BaseResponseModelToJson(BaseResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'message': instance.message,
      'code': instance.code,
    };
