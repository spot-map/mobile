import 'package:ride_map/domain/entities/token_models/token_model.dart';

abstract class AuthApi {
  Future<TokenModel> login(String email, String password);

  Future<TokenModel> registration(String email, String password, String name);

  Future<bool> logout();

  Future<TokenModel> refresh();
}
