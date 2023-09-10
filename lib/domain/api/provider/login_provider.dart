import 'package:injectable/injectable.dart';
import 'package:ride_map/domain/api/repository/i_auth_repository.dart';
import 'package:ride_map/internal/di/inject.dart';

@injectable
class AuthProvider {
  final _loginService = getIt.get<IAuthRepository>();

  Future<void> login(String email, String password) =>
      _loginService.login(email, password);

  Future<void> registration(String email, String password, String name) =>
      _loginService.registration(email, password, name);

  Future<void> logout() => _loginService.logout();

  Future<void> refreshToken() => _loginService.refreshToken();
}

class NetworkError extends Error {}
