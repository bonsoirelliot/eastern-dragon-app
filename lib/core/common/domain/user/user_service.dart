import 'package:eastern_dragon/core/common/data/models/base_response/base_response_model.dart';
import 'package:eastern_dragon/core/common/domain/services/request_handler.dart';

/// Сервис, который запрашивает данные авторизованного пользователя в сыром виде
/// (BaseResponseModel)
class UserService {
  final RequestHandler requestHandler;

  UserService({required this.requestHandler});

  /// Метод для загрузки данных авторизованного пользователя в сыром виде
  Future<BaseResponseModel> loadUserData(int id) async {
    final response = await requestHandler.get('/user/$id');
    final json = response.data as Map<String, dynamic>;
    final baseResponse = BaseResponseModel.fromJson(json);

    return baseResponse;
  }

  /// Метод для выхода
  Future<BaseResponseModel> logout() async {
    final response = await requestHandler.get('/user/logout');
    final json = response.data as Map<String, dynamic>;
    final baseResponse = BaseResponseModel.fromJson(json);

    return baseResponse;
  }

  /// Метод для удаления аккаунта
  // Future<BaseResponseModel> deleteAccount() async {
  //   final response = await requestHandler.get('/user/remove');
  //   final json = response.data as Map<String, dynamic>;
  //   final baseResponse = BaseResponseModel.fromJson(json);

  //   return baseResponse;
  // }

  /// Метод для изменения данных пользователя
  // Future<BaseResponseModel> updateUserData({
  //   String? firstName,
  //   String? lastName,
  //   String? email,
  //   String? birthday,
  //   String? gender,
  //   bool? subscribe,
  // }) async {
  //   final response = await requestHandler.post(
  //     '/user/upd',
  //     data: FormData.fromMap(
  //       <String, dynamic>{
  //         if (firstName?.isNotEmpty ?? false) 'fields[firstName]': firstName,
  //         if (lastName?.isNotEmpty ?? false) 'fields[lastName]': lastName,
  //         if (email?.isNotEmpty ?? false) 'fields[email]': email,
  //         if (birthday?.isNotEmpty ?? false) 'fields[birthday]': birthday,
  //         if (gender?.isNotEmpty ?? false) 'fields[gender]': gender,
  //         if (subscribe != null) 'fields[subscribe]': subscribe ? 'Y' : 'N',
  //       },
  //     ),
  //   );

  //   final json = response.data as Map<String, dynamic>;
  //   final baseResponse = BaseResponseModel.fromJson(json);

  //   return baseResponse;
  // }
}
