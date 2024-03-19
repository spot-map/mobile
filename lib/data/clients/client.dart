import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:ride_map/core/di/inject.dart';
import 'package:ride_map/data/clients/interceptors/token_interceptor.dart';
import 'package:ride_map/data/clients/url/urls.dart';
import 'package:ride_map/data/storage/token.dart';
import 'package:ride_map/domain/usecases/auth/auth.dart';

class Client {
  final logger = Logger();
  final TokenInterceptor _tokenInterceptor = getIt();
  final TokenStorage _tokensStorage = getIt();
  final AuthUseCase _auth = getIt();

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
        if (e.response?.statusCode == 401) {
          await _auth.refresh();

          e.requestOptions.headers['Authorization'] = 'Bearer ${_tokensStorage.accessToken}';

          return handler.resolve(await client.fetch(e.requestOptions));
        }
        return handler.next(e);
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
