import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ride_map/domain/storage/token.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/until/api/api_constants.dart';

class TokenInterceptor extends Interceptor {
  final TokenStorage _tokensStorage = getIt();

  Future<RequestOptions> requestInterceptor(RequestOptions options, Dio client) async {
    if (noTokenPaths.any((element) => options.path.endsWith(element))) {
      return options;
    }
    if (_tokensStorage.accessToken != null) {
      options.data ??= {};
      options.headers['Authorization'] = 'Bearer ${_tokensStorage.accessToken}';
      return options;
    }

    return options;
  }
}

const List noTokenPaths = [
  ApiConstants.LOGIN,
  ApiConstants.REGISTRATION,
  ApiConstants.MAP,
  ApiConstants.SPOT_BY_ID,
  ApiConstants.SEARCH_SPOT
];
