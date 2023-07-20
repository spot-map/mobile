import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ride_map/untils/api/api_constants.dart';


@Singleton()
class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.options = BaseOptions(
      baseUrl: ApiConstants.BASE_URL_DEV,
      receiveTimeout: 10000,
      connectTimeout: 10000,
      sendTimeout: 10000,
    );
  }

  Dio get dio => _dio;
}