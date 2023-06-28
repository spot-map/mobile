import 'package:injectable/injectable.dart';

abstract class IAuthRepository {
  @module
  Future<void> login(String email, String password);

  @module
  Future<void> registration(String email, String password, String name);

  @module
  Future<void> logout();

  @module
  Future<void> refreshToken();
}
