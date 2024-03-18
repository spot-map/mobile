import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ride_map/domain/storage/token.dart';
import 'package:ride_map/domain/usecases/api/auth.dart';
import 'package:ride_map/internal/di/inject.dart';

class RefreshInterceptor extends Interceptor {
  final TokenStorage _tokensStorage = getIt();
  final AuthUseCase _auth = getIt();

  Future<RequestOptions> refreshInterceptor(DioException e, handler, Dio client) async {
    if (e.response?.statusCode == 401) {
      await _auth.refreshToken();
      e.requestOptions.headers['Authorization'] = 'Bearer ${_tokensStorage.accessToken}';
      return handler.resolve(await client.fetch(e.requestOptions));
    }
    return handler.next(e);
  }
}
