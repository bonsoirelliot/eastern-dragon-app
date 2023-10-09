import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:eastern_dragon/common/data/models/app_metadata.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as pp;

class RequestHandler {
  static final RequestHandler _singleton = RequestHandler._init();

  static AppMetadata? appMetadata;

  CookieManager? _cookieManager;
  late Dio? _dio;

  factory RequestHandler({
    required AppMetadata metadata,
  }) {
    appMetadata ??= metadata;
    final handler = _singleton;
    // _userWM ??= userWM;

    return handler;
  }

  RequestHandler._init() {
    _dio = _createDio();
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    //! debugPrint('userToken1: ${UserRepository.currentUser?.token}');

    late Response<T> res;

    try {
      res = await _dio!.get(
        path,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: await _getOptions(options),
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      final result = e.response;
      debugPrint('statusCode get ($path): ${result?.statusCode}');
      rethrow;
    }

    res.requestOptions.headers.forEach((key, dynamic value) {
      debugPrint('КУКИ: $key = $value');
    });

    // _checkAccess(res);

    return res;
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    //debugPrint(UserRepository.currentUser?.token);

    late Response<T> res;

    try {
      res = await _dio!.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: await _getOptions(options),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      final result = e.response;
      debugPrint('statusCode post ($path): ${result?.statusCode}');
      rethrow;
    }
    // _checkAccess(res);

    return res;
  }

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    late Response<T> res;
    try {
      res = await _dio!.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: await _getOptions(options),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      final result = e.response;
      debugPrint('statusCode put ($path): ${result?.statusCode}');
      rethrow;
    }

    return res;
  }

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    // void Function(int, int)? onSendProgress,
    // void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      return _dio!.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: await _getOptions(options),
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      final result = e.response;

      debugPrint('statusCode delete ($path): ${result?.statusCode}');

      // if ((result?.statusCode == 401 || result?.statusCode == 403) &&
      //     globalContext != null) {
      //   Provider.of<AuthWM>(globalContext!, listen: false).logout();
      // }

      rethrow;
    }
  }

  // void _checkAccess(Response res) {
  //   if (((res.data as Map<String, dynamic>)['code'] as int?) == 403 &&
  //       _userWM?.userData != null) {
  //     _userWM?.unauthorize();
  //    }
  // }

  Future<Options> _getOptions(Options? options) async {
    return options != null
        ? options.copyWith(
            headers: options.headers != null
                ? (options.headers!
                  ..addAll(
                    <String, dynamic>{
                      'system': options.headers!.containsKey('system')
                          ? options.headers!['system']
                          : appMetadata?.systemName,
                      'system-version': appMetadata?.systemVersion,
                      'version': appMetadata?.appVersion,
                      'device-version': appMetadata?.deviceVersion,
                      'is-release': appMetadata?.isRelease,
                      'processors-count': appMetadata?.processorsCount,
                      'locale': appMetadata?.locale,
                      'app-build-timestamp': appMetadata?.appBuildTimestamp,
                      'app-launched-date-time':
                          appMetadata?.appLaunchedDateTime,
                      'device-id': appMetadata?.deviceID,
                      'build-number': appMetadata?.appBuildNumber,
                    },
                  ))
                : <String, dynamic>{
                    'system-version': appMetadata?.systemVersion,
                    'version': appMetadata?.appVersion,
                    'device-version': appMetadata?.deviceVersion,
                    'is-release': appMetadata?.isRelease,
                    'processors-count': appMetadata?.processorsCount,
                    'locale': appMetadata?.locale,
                    'app-build-timestamp': appMetadata?.appBuildTimestamp,
                    'app-launched-date-time': appMetadata?.appLaunchedDateTime,
                    'device-id': appMetadata?.deviceID,
                    'build-number': appMetadata?.appBuildNumber,
                  },
          )
        : Options(
            headers: <String, dynamic>{
              'system-version': appMetadata?.systemVersion,
              'version': appMetadata?.appVersion,
              'device-version': appMetadata?.deviceVersion,
              'is-release': appMetadata?.isRelease,
              'processors-count': appMetadata?.processorsCount,
              'locale': appMetadata?.locale,
              'app-build-timestamp': appMetadata?.appBuildTimestamp,
              'app-launched-date-time': appMetadata?.appLaunchedDateTime,
              'device-id': appMetadata?.deviceID,
              'build-number': appMetadata?.appBuildNumber,
            },
          );
  }

  Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(milliseconds: 20000),
        receiveTimeout: const Duration(milliseconds: 40000),
      ),
    );

    if (_cookieManager == null) {
      try {
        pp.getApplicationDocumentsDirectory().then((dir) {
          _cookieManager = CookieManager(
            PersistCookieJar(
              storage: FileStorage('${dir.path}/.cookie/'),
            ),
          );
          dio.interceptors.add(_cookieManager!);
        });
      } catch (e) {
        debugPrint(e.toString());
      }
    }

    return dio;
  }
}
