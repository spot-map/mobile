import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ride_map/core/di/inject.dart';
import 'package:ride_map/data/storage/token.dart';
import 'package:ride_map/domain/usecases/auth/auth.dart';

class RefreshInterceptor extends Interceptor {
  final TokenStorage _tokensStorage = getIt();
  final AuthUseCase _auth = getIt();

  Future<RequestOptions> refreshInterceptor(DioException e, handler, Dio client) async {
    if (e.response?.statusCode == 401) {
      await _auth.refresh();
      e.requestOptions.headers['Authorization'] = 'Bearer ${_tokensStorage.accessToken}';
      return handler.resolve(await client.fetch(e.requestOptions));
    }
    return handler.next(e);
  }
}
