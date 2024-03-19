import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:ride_map/core/di/inject.dart';
import 'package:ride_map/data/clients/interceptors/refresh_interceptor.dart';
import 'package:ride_map/data/clients/interceptors/token_interceptor.dart';
import 'package:ride_map/data/clients/url/urls.dart';

class Client {
  final logger = Logger();
  final TokenInterceptor _tokenInterceptor = getIt();
  final RefreshInterceptor _refreshInterceptor = getIt();

  Dio create() {
    final Dio client = Dio(BaseOptions(
      baseUrl: ApiConstants.BASE_URL,
      receiveTimeout: const Duration(seconds: 10000),
      connectTimeout: const Duration(seconds: 10000),
      sendTimeout: const Duration(seconds: 10000),
      validateStatus: (status) => true,
      followRedirects: false,
    ));
    client.options.headers = {'Content-Type': 'application/json', 'Accept': 'application/json'};
    client.interceptors.addAll([
      InterceptorsWrapper(onRequest: (options, handler) async {
        final newOptions = await _tokenInterceptor.requestInterceptor(options, client);
        return handler.next(newOptions);
      }, onError: (e, handler) async {
        final errorOption = await _refreshInterceptor.errorInterceptor(e, handler, client);
        return handler.next(errorOption);
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
