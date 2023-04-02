
import 'package:injectable/injectable.dart';
import 'package:ride_map/domain/api/repository/i_auth_repository.dart';

@Injectable(as: IAuthRepository)
class Auth implements IAuthRepository{

  @override
  Future<void> auth(String email, String password) {
    // TODO: implement auth
    throw UnimplementedError();
  }

}