import 'package:injectable/injectable.dart';
import 'package:ride_map/domain/api/repository/i_registration_repository.dart';
import 'package:ride_map/domain/api/service/registration_service.dart';

@injectable
class RegistrationProvider implements IRegistrationRepository {
  final _service = RegistrationService();

  @override
  Future<void> registration(String email, String password, String name) {
    return _service.registration(email, password, name);
  }
}

class NetworkError extends Error {}
