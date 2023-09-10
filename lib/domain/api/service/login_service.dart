import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:ride_map/domain/api/repository/i_auth_repository.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/until/api/api_constants.dart';
import 'package:ride_map/until/dev.dart';
import 'package:ride_map/until/dio/dio_client.dart';
import 'package:ride_map/until/preferences/preferences.dart';

@Injectable(as: IAuthRepository)
class AuthService implements IAuthRepository {
  final dioClient = getIt.get<DioClient>();

  @override
  Future<void> login(String email, String password) async {
    var authObject = {"email": email, "password": password};
    Response response =
        await dioClient.dio.post(ApiConstants.LOGIN, data: authObject);
    Dev.log('AUTH CODE ${response.statusCode}', name: 'USER AUTH');
    Dev.log('AUTH OBJECT $authObject', name: 'USER AUTH');

    if (response.statusCode == 200) {
      Dev.log('AUTH ${response.data}', name: 'USER AUTH');
      Prefs.setString('token', response.data['data']['token']);
      Dev.log('SAVED ${Prefs.getString('token')}', name: 'PREFS');
    }
  }

  @override
  Future<void> registration(String name, String email, String password) async {
    var registrationObject = {
      "name": name,
      "email": email,
      "password": password,
    };
    Dev.log('$email $name $password');
    Response response = await dioClient.dio
        .post(ApiConstants.REGISTRATION, data: registrationObject);
    Dev.log('REGISTRATION CODE ${response.statusCode}',
        name: 'USER REGISTRATION');
    Dev.log('REGISTRATION OBJECT $registrationObject',
        name: 'USER REGISTRATION');

    if (response.statusCode == 200) {
      Dev.log('REGISTRATION ${response.data}',
          name: 'USER REGISTRATION SUCCESS');
      Prefs.setString('token', response.data['data']['token']);
      return response.data;
    }
  }

  @override
  Future<void> logout() async {
    dioClient.dio.options.headers = {
      'Authorization': 'Bearer ${Prefs.getString('token')}',
    };

    Response response = await dioClient.dio.post(ApiConstants.LOGOUT);
    Dev.log('LOGOUT ${response.statusCode}', name: 'USER LOGOUT');
    if (response.statusCode == 200) {
      Prefs.remove('token');
    }
  }

  @override
  Future<void> refreshToken() async {
    dioClient.dio.options.headers = {
      'Authorization': 'Bearer ${Prefs.getString('token')}',
    };

    Response response = await dioClient.dio.post(ApiConstants.REFRESH);
    Dev.log('REFRESH ${response.statusCode}', name: 'USER REFRESH');
    if (response.statusCode == 200) {
      Dev.log('REFRESH ${response.data}',
          name: '${response.statusCode} REFRESH');
      Prefs.setString('token', response.data['data']['token']);
      Dev.log('PREFS ${Prefs.getString('token')}', name: 'REFRESH PREFS');
    }
  }
}
