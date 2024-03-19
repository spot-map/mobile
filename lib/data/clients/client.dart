import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:ride_map/core/di/inject.dart';
import 'package:ride_map/data/clients/interceptors/token_interceptor.dart';
import 'package:ride_map/data/clients/url/urls.dart';

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
    client.options.headers = {'Content-Type': 'application/json', 'Accept': 'application/json'};
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
