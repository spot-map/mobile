import 'package:dio/dio.dart';
import 'package:ride_map/until/api/api_constants.dart';

class Client{
  Dio create(){
    final Dio client = Dio(
        BaseOptions(
          baseUrl: ApiConstants.BASE_URL,
          receiveTimeout: 10000,
          connectTimeout: 10000,
          sendTimeout: 10000,
        )
    );

    return client;
  }
}