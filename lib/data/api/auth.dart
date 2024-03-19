import 'package:dio/dio.dart';
import 'package:ride_map/core/di/inject.dart';
import 'package:ride_map/data/clients/url/urls.dart';
import 'package:ride_map/domain/data/api/auth_api.dart';
import 'package:ride_map/domain/entities/token_models/token_model.dart';

class AuthApiImpl implements AuthApi {
  final Dio _client = getIt();

  @override
  Future<TokenModel> login(String email, String password) async {
    final response = await _client.post('${ApiConstants.AUTH}/login', data: {"email": email, "password": password});
    return TokenModel.fromJson(response.data);
  }

  @override
  Future<TokenModel> registration(String name, String email, String password) async {
    final response = await _client.post('${ApiConstants.AUTH}/registration', data: {
      "name": name,
      "email": email,
      "password": password,
    });
    return TokenModel.fromJson(response.data);
  }

  @override
  Future<bool> logout() async {
    final response = await _client.post('${ApiConstants.AUTH}/logout');
    return response.statusCode == 200;
  }

  @override
  Future<TokenModel> refresh() async {
    final response = await _client.post('${ApiConstants.AUTH}/refresh');
    return TokenModel.fromJson(response.data);
  }
}
