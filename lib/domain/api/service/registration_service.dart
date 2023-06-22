import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ride_map/domain/api/repository/i_registration_repository.dart';
import 'package:ride_map/untils/api/api_constants.dart';
import 'package:ride_map/untils/dev.dart';
import 'package:ride_map/untils/dio/dio_manager.dart';

@Injectable(as: IRegistrationRepository)
class RegistrationService implements IRegistrationRepository {
  @override
  Future<void> registration(String email, String password, String name) async {
    var registrationObject = {
      "name": name,
      "email": email,
      "password": password
    };

    Response response = await DioManager()
        .dio
        .post(ApiConstants.REGISTRATION, data: registrationObject);
    Dev.log('REGISTRATION CODE ${response.statusCode}',
        name: 'USER REGISTRATION');
    Dev.log('REGISTRATION OBJECT $registrationObject',
        name: 'USER REGISTRATION');

    if (response.statusCode == 201) {
      Dev.log('REGISTRATION ${response.data}',
          name: 'USER REGISTRATION SUCCESS');
    }
  }
}
