import 'package:injectable/injectable.dart';
import 'package:ride_map/internal/entity/result.dart';

abstract class IAuthRepository {
  @module
  Future<Result> login(String email, String password);

  @module
  Future<Result> registration(String email, String password, String name);

  @module
  Future<void> logout();

  @module
  Future<void> refreshToken();
}
