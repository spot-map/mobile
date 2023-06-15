import 'package:injectable/injectable.dart';

abstract class IAuthRepository {
  @module
  Future<void> auth(String email, String password);
}


