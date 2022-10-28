import 'dart:io';

import 'package:dio/dio.dart';

class DioManager {
  static DioManager? _instance;

  factory DioManager() => _instance ??= DioManager._();

  DioManager._()
      : dio = Dio(BaseOptions(
      baseUrl: '',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.json,
      headers: {
       // 'Authorization': 'Bearer ${Preferences().getToken}',
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF8',
        HttpHeaders.acceptHeader: 'application/json',
      }));

  late final Dio dio;
}
