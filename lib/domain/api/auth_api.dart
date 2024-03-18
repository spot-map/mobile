import 'package:dio/dio.dart';
import 'package:ride_map/data/token_models/token_model.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/until/api/api_constants.dart';

abstract class AuthApi {
  Future<TokenModel> login(String email, String password);

  Future<TokenModel> registration(String email, String password, String name);

  Future<bool> logout();

  Future<TokenModel> refresh();
}

class AuthApiImpl implements AuthApi {
  final Dio _client = getIt();

  @override
  Future<TokenModel> login(String email, String password) async {
    final response = await _client.post(ApiConstants.LOGIN, data: {"email": email, "password": password});
    return TokenModel.fromJson(response.data['data']['token']);
  }

  @override
  Future<TokenModel> registration(String name, String email, String password) async {
    Response response = await _client.post(ApiConstants.REGISTRATION, data: {
      "name": name,
      "email": email,
      "password": password,
    });
    return TokenModel.fromJson(response.data['data']['token']);
  }

  @override
  Future<bool> logout() async {
    Response response = await _client.post(ApiConstants.LOGOUT);
    return response.statusCode == 200;
  }

  @override
  Future<TokenModel> refresh() async {
    Response response = await _client.post(ApiConstants.REFRESH);
    return TokenModel.fromJson(response.data['data']['token']);
  }
}
