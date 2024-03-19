import 'package:dio/dio.dart';
import 'package:ride_map/core/di/inject.dart';
import 'package:ride_map/data/clients/url/urls.dart';
import 'package:ride_map/data/storage/token.dart';
import 'package:ride_map/domain/entities/token_models/token_model.dart';

class RefreshInterceptor extends Interceptor {
  final TokenStorage _tokensStorage = getIt();

  Future<DioException> errorInterceptor(DioException e, handler, Dio client) async {

    if (e.response?.statusCode == 401) {
      await _refresh(client);
      e.requestOptions.headers['Authorization'] = 'Bearer ${_tokensStorage.accessToken}';

      return handler.resolve(await client.fetch(e.requestOptions));
    }

    return e;
  }

  Future<void> _refresh(Dio client) async {
    final response = await client.post('${ApiConstants.AUTH}/refresh');
    _tokensStorage.accessToken = response.data['data']['token'];
  }
}