import 'package:injectable/injectable.dart';
import 'package:ride_map/domain/api/repository/i_auth_repository.dart';
import 'package:ride_map/domain/api/service/login_service.dart';

@injectable
class AuthProvider implements IAuthRepository {
  final _service = AuthService();

  @override
  Future<void> auth(String email, String password) async {
    return _service.auth(email, password);
  }

  @override
  Future<void> registration(String email, String password, String name) {
    return _service.registration(email, password, name);
  }
}

class NetworkError extends Error {}
