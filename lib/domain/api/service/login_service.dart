import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:ride_map/domain/api/repository/i_auth_repository.dart';
import 'package:ride_map/untils/api/api_constants.dart';
import 'package:ride_map/untils/dev.dart';
import 'package:ride_map/untils/dio/dio_manager.dart';
import 'package:ride_map/untils/preferences/preferences.dart';

@Injectable(as: IAuthRepository)
class AuthService implements IAuthRepository {
  @override
  Future<void> auth(String email, String password) async {
    var authObject = {"email": email, "password": password};

    Response response =
        await DioManager().dio.post(ApiConstants.LOGIN, data: authObject);
    Dev.log('AUTH CODE ${response.statusCode}', name: 'USER AUTH');
    Dev.log('AUTH OBJECT $authObject', name: 'USER AUTH');

    if (response.statusCode == 200) {
      Dev.log('AUTH ${response.data}', name: 'USER AUTH');
      Prefs.setString('token', jsonEncode(response.data['data']['token']));
      Dev.log('SAVED ${Prefs.getString('token')}', name: 'PREFS');
    }
  }

  @override
  Future<void> registration(String name,String email, String password) async {
    var registrationObject = {
      "name": name,
      "email": email,
      "password": password
    };

    Dev.log('${registrationObject.values}');
    Dev.log('${registrationObject.entries}');
    Dev.log('$email $name $password');
    Response response = await DioManager()
        .dio
        .post(ApiConstants.REGISTRATION, data: registrationObject);
    Dev.log('REGISTRATION CODE ${response.statusCode}',
        name: 'USER REGISTRATION');
    Dev.log('REGISTRATION OBJECT $registrationObject',
        name: 'USER REGISTRATION');

    if (response.statusCode == 200) {
      Dev.log('REGISTRATION ${response.data}',
          name: 'USER REGISTRATION SUCCESS');
      return response.data;

    }
  }
}
