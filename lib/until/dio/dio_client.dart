import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:ride_map/until/api/api_constants.dart';

class Client {
  final logger = Logger();

  Dio create() {
    final Dio client = Dio(BaseOptions(
      baseUrl: ApiConstants.BASE_URL,
      receiveTimeout: const Duration(seconds: 10000),
      connectTimeout: const Duration(seconds: 10000),
      sendTimeout: const Duration(seconds: 10000),
    ));

    client.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (m) => {logger.i(m.toString())},
      ),
    );

    return client;
  }
}
