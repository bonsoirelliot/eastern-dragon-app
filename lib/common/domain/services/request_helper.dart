// ignore_for_file: avoid_annotating_with_dynamic

import 'package:eastern_dragon/common/data/models/base_response/base_response_model.dart';
import 'package:eastern_dragon/common/domain/services/request_handler.dart';

class RequestHelper {
  final RequestHandler requestHandler;

  RequestHelper({required this.requestHandler});

  // static Future<T> getSimpleObject<T>(
  //   String path,
  // ) async {
  //   final response = await _rh.get(path);

  //   return response.data as T;
  // }

  // static Future<List<T>> getListOfSimpleObjects<T>(
  //   String path,
  // ) async {
  //   final response = await _rh.get(path);

  //   final list =
  //       (response.data as List<dynamic>).map((dynamic e) => e as T).toList();

  //   return list;
  // }

   Future<T> getObject<T>(
    String path,
    T Function(Map<String, dynamic>) fromJson, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await requestHandler.get<dynamic>(
      path,
      queryParameters: queryParameters,
    );

    final baseRes =
        BaseResponseModel.fromJson(response.data as Map<String, dynamic>);

    final obj = fromJson(baseRes.data as Map<String, dynamic>);

    return obj;
  }

   Future<List<T>> getListOfObjects<T>(
    String path,
    T Function(Map<String, dynamic>) fromJson, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await requestHandler.get<dynamic>(
      path,
      queryParameters: queryParameters,
    );

    final baseRes =
        BaseResponseModel.fromJson(response.data as Map<String, dynamic>);

    // print('banan  ${baseRes.data}');
    final list = (baseRes.data as List<dynamic>)
        .map((dynamic e) => fromJson(e as Map<String, dynamic>))
        .toList();

    return list;
  }
}
