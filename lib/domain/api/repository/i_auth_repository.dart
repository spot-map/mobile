import 'package:ride_map/internal/entity/result.dart';

abstract class IAuthRepository {
  Future<Result> login(String email, String password);

  Future<Result> registration(String email, String password, String name);

  Future<void> logout();

  Future<void> refreshToken();
}
