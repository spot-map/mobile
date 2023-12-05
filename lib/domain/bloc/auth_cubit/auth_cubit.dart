import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ride_map/domain/api/provider/login_provider.dart';
import 'package:ride_map/internal/di/inject.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final _provider = getIt.get<AuthProvider>();
  AuthCubit() : super(const AuthState());

  onLogin(String email, String password) async{
    await _provider.login(email, password);
  }

  onRegistration(String email, String password, String name) async{
    await _provider.registration(email, password, name);
  }

  onLogout()async{
    await _provider.logout();
  }
}
