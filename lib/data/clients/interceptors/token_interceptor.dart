import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ride_map/core/di/inject.dart';
import 'package:ride_map/data/clients/url/urls.dart';
import 'package:ride_map/data/storage/token.dart';

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

List noTokenPaths = [
  '${ApiConstants.AUTH}/login',
  '${ApiConstants.AUTH}/registration',
  '${ApiConstants.SPOT}/index',
  '${ApiConstants.SPOT}/show',
  '${ApiConstants.SPOT}/search',
];
