import 'package:dio/dio.dart';
import 'package:ride_map/domain/entity/result.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/until/api/api_constants.dart';
import 'package:ride_map/until/dev.dart';
import 'package:ride_map/until/preferences/preferences.dart';

abstract class AuthApi {
  Future<Result> login(String email, String password);

  Future<Result> registration(String email, String password, String name);

  Future<void> logout();

  Future<void> refreshToken();
}


class AuthApiImpl implements AuthApi {
  final Dio _client = getIt();


  @override
  Future<Result> login(String email, String password) async {
    var authObject = {"email": email, "password": password};
    try {
      Response response = await _client.post(ApiConstants.LOGIN, data: authObject);
      Dev.log('AUTH CODE ${response.statusCode}', name: 'USER AUTH');
      Dev.log('AUTH OBJECT $authObject', name: 'USER AUTH');

      if (response.statusCode == 200) {
        if (response.data['data']['success'] == false) {
          throw Exception('Ошибка авторизации');
        } else {
          Dev.log('AUTH ${response.data}', name: 'USER AUTH');
          Prefs.setString('token', response.data['data']['token']);
          Dev.log('SAVED ${Prefs.getString('token')}', name: 'PREFS');
          return Result.success(true);
        }
      }
      return Result.failure('');
    } on DioError catch (e) {
      return Result.failure(e.message);
    }
  }

  @override
  Future<Result> registration(String name, String email, String password) async {
    Response response = await _client.post(ApiConstants.REGISTRATION, data: {
      "name": name,
      "email": email,
      "password": password,
    });
    Dev.log('REGISTRATION CODE ${response.statusCode}', name: 'USER REGISTRATION');
    if (response.statusCode == 200) {
      Dev.log('REGISTRATION ${response.data}', name: 'USER REGISTRATION SUCCESS');
      Prefs.setString('token', response.data['data']['token']);
      return Result.success(true);
    }
    return Result.failure('');
  }

  @override
  Future<void> logout() async {
    _client.options.headers = {
      'Authorization': 'Bearer ${Prefs.getString('token')}',
    };

    Response response = await _client.post(ApiConstants.LOGOUT);
    Dev.log('LOGOUT ${response.statusCode}', name: 'USER LOGOUT');
    if (response.statusCode == 200) {
      Prefs.remove('token');
    }
  }

  @override
  Future<void> refreshToken() async {
    _client.options.headers = {
      'Authorization': 'Bearer ${Prefs.getString('token')}',
    };

    Response response = await _client.post(ApiConstants.REFRESH);
    Dev.log('REFRESH ${response.statusCode}', name: 'USER REFRESH');
    if (response.statusCode == 200) {
      Dev.log('REFRESH ${response.data}', name: '${response.statusCode} REFRESH');
      Prefs.setString('token', response.data['data']['token']);
      Dev.log('PREFS ${Prefs.getString('token')}', name: 'REFRESH PREFS');
    }
  }
}
