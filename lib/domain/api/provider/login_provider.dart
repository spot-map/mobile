import 'package:injectable/injectable.dart';
import 'package:ride_map/domain/api/repository/i_auth_repository.dart';
import 'package:ride_map/internal/di/inject.dart';

@injectable
class AuthProvider {
  final _service = getIt.get<IAuthRepository>();

  Future<void> login(String email, String password) async {
    return _service.login(email, password);
  }

  Future<void> registration(String email, String password, String name) {
    return _service.registration(email, password, name);
  }

  Future<void> logout() {
    return _service.logout();
  }

  Future<void> refreshToken() {
    return _service.refreshToken();
  }
}

class NetworkError extends Error {}
