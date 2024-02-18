import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:ride_map/internal/di/inject.dart';

import 'package:ride_map/until/api/api_constants.dart';
import 'package:ride_map/until/dio/interceptors/token_interceptor.dart';

class Client {
  final logger = Logger();
  final TokenInterceptor _tokenInterceptor = getIt();


  Dio create() {
    final Dio client = Dio(BaseOptions(
      baseUrl: ApiConstants.BASE_URL,
      receiveTimeout: const Duration(seconds: 10000),
      connectTimeout: const Duration(seconds: 10000),
      sendTimeout: const Duration(seconds: 10000),
    ));

    client.interceptors.addAll([
      InterceptorsWrapper(onRequest: (options, handler) async {
        final newOptions = await _tokenInterceptor.requestInterceptor(options, client);
        return handler.next(newOptions);
      }),
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (m) => {logger.i(m.toString())},
      ),
    ]);

    return client;
  }
}
