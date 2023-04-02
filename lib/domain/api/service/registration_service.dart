
import 'package:injectable/injectable.dart';
import 'package:ride_map/domain/api/repository/i_registration_repository.dart';

@Injectable(as: IRegistrationRepository)
class Registration implements IRegistrationRepository{
  @override
  Future<void> registration(String email, String password, String name) {
    // TODO: implement registration
    throw UnimplementedError();
  }

}