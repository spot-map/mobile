import 'package:ride_map/domain/api/service/auth_api.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/internal/entity/result.dart';

abstract class AuthUseCase {
  Future<Result> login(String email, String password);

  Future<Result> registration(String email, String password, String name);

  Future<void> logout();

  Future<void> refreshToken();
}

class AuthUseCaseImpl implements AuthUseCase {
  final AuthApi _authApi = getIt();

  @override
  Future<Result> login(String email, String password) => _authApi.login(email, password);

  @override
  Future<Result> registration(String email, String password, String name) => _authApi.registration(email, password, name);

  @override
  Future<void> logout() => _authApi.logout();

  @override
  Future<void> refreshToken() => _authApi.refreshToken();
}
