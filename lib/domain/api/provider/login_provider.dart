import 'package:injectable/injectable.dart';
import 'package:ride_map/domain/api/repository/i_auth_repository.dart';
import 'package:ride_map/domain/api/service/login_service.dart';

@injectable
class LoginProvider implements IAuthRepository {
  final _service = LoginService();

  @override
  Future<void> auth(String email, String password) async {
    return _service.auth(email, password);
  }
}

class NetworkError extends Error {}
