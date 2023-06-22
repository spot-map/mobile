import 'package:injectable/injectable.dart';

abstract class IRegistrationRepository {
  @module
  Future<void> registration(String email, String password, String name);
}
