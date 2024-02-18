import 'package:dio/dio.dart';
import 'package:eastern_dragon/core/common/data/models/base_response/base_response_model.dart';
import 'package:eastern_dragon/core/common/domain/services/request_handler.dart';
import 'package:elementary/elementary.dart';

class AuthScreenModel extends ElementaryModel {
  AuthScreenModel({
    required this.requestHandler,
  }) : super();

  final RequestHandler requestHandler;

  Future<bool> sendEmailCode(String email) async {
    final response = await requestHandler.post(
      '/user/auth/',
      data: FormData.fromMap(
        <String, dynamic>{
          'email': email,
        },
      ),
    );

    final baseRes = BaseResponseModel.fromJson(response.data as Map<String, dynamic>);

    return baseRes.data as bool;
  }

  Future<int> auth(String code) async {
    final response = await requestHandler.post(
      '/user/code/',
      data: FormData.fromMap(
        <String, dynamic>{
          'code': code,
        },
      ),
    );

    final baseRes = BaseResponseModel.fromJson(response.data as Map<String, dynamic>);

    final id = (baseRes.data as Map<String, dynamic>)['id'] as String;

    return int.parse(id);
  }
}
