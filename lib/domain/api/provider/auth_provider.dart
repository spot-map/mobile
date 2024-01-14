import 'package:ride_map/domain/api/service/auth_repository_impl.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/internal/entity/result.dart';


abstract class AuthProvider {
  Future<Result> login(String email, String password);

  Future<Result> registration(String email, String password, String name);

  Future<void> logout();

  Future<void> refreshToken();
}

class AuthProviderImpl implements AuthProvider {
  final AuthRepository _loginService = getIt();

  @override
  Future<Result> login(String email, String password) => _loginService.login(email, password);

  @override
  Future<Result> registration(String email, String password, String name) => _loginService.registration(email, password, name);

  @override
  Future<void> logout() => _loginService.logout();

  @override
  Future<void> refreshToken() => _loginService.refreshToken();
}
