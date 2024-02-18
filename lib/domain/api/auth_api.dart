import 'package:dio/dio.dart';
import 'package:ride_map/data/result_entity/result.dart';
import 'package:ride_map/domain/storage/token.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/until/api/api_constants.dart';

abstract class AuthApi {
  Future<Result> login(String email, String password);

  Future<Result> registration(String email, String password, String name);

  Future<void> logout();

  Future<void> refreshToken();
}

class AuthApiImpl implements AuthApi {
  final Dio _client = getIt();
  final TokenStorage _tokenStorage = getIt();

  @override
  Future<Result> login(String email, String password) async {
    var authObject = {"email": email, "password": password};
    try {
      Response response = await _client.post(ApiConstants.LOGIN, data: authObject);
      if (response.statusCode == 200) {
        if (response.data['data']['success'] == false) {
          return Result.failure('${response.data['data']['message']}');
        } else {
          _tokenStorage.accessToken = response.data['data']['token'];
          return Result.success(true);
        }
      }
      return Result.failure('');
    } on DioError catch (e) {
      return Result.failure(e.message ?? '');
    }
  }

  @override
  Future<Result> registration(String name, String email, String password) async {
    Response response = await _client.post(ApiConstants.REGISTRATION, data: {
      "name": name,
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      _tokenStorage.accessToken = response.data['data']['token'];
      return Result.success(true);
    }
    return Result.failure('');
  }

  @override
  Future<void> logout() async {
    _client.options.headers = {
      'Authorization': 'Bearer ${_tokenStorage.accessToken}',
    };

    Response response = await _client.post(ApiConstants.LOGOUT);
    if (response.statusCode == 200) _tokenStorage.deleteTokens();
  }

  @override
  Future<void> refreshToken() async {
    _client.options.headers = {
      'Authorization': 'Bearer ${_tokenStorage.accessToken}',
    };

    Response response = await _client.post(ApiConstants.REFRESH);
    if (response.statusCode == 200) _tokenStorage.accessToken = response.data['data']['token'];
  }
}
