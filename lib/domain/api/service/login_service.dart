import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:ride_map/domain/api/repository/i_auth_repository.dart';
import 'package:ride_map/untils/api/api_constants.dart';
import 'package:ride_map/untils/dev.dart';
import 'package:ride_map/untils/dio/dio_manager.dart';
import 'package:ride_map/untils/preferences/preferences.dart';

@Injectable(as: IAuthRepository)
class LoginService implements IAuthRepository {
  @override
  Future<void> auth(String email, String password) async {
    var authObject = {"email": email, "password": password};

    Response response =
        await DioManager().dio.post(ApiConstants.LOGIN, data: authObject);
    Dev.log('AUTH CODE ${response.statusCode}', name: 'USER AUTH');
    Dev.log('AUTH OBJECT $authObject', name: 'USER AUTH');

    if (response.statusCode == 201) {
      Dev.log('AUTH ${response.data}', name: 'USER AUTH');
      Preferences().setToken(jsonEncode(response.data['token']));
    }
  }
}
