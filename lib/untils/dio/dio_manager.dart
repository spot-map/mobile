import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ride_map/untils/api/api_constants.dart';

import '../preferences/preferences.dart';

class DioManager {
  static DioManager? _instance;

  factory DioManager() => _instance ??= DioManager._();

  DioManager._()
      : dio = Dio(BaseOptions(
            baseUrl: ApiConstants.BASE_URL_LOCAL,
            connectTimeout: 5000,
            receiveTimeout: 3000,
            responseType: ResponseType.json,
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=UTF8',
              HttpHeaders.acceptHeader: 'application/json',
            }));

  late final Dio dio;
}
