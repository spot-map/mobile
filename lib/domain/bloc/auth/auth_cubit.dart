import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ride_map/domain/api/provider/auth_provider.dart';
import 'package:ride_map/internal/di/inject.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthProvider _provider = getIt();

  AuthCubit() : super(const AuthState());

  onLogin(String email, String password) async {
    final result = await _provider.login(email, password);
    if (result.isSuccess) {
      emit(state.copyWith(isLogin: true));
    } else {
      emit(state.copyWith(isLogin: false));
    }
  }

  onRegistration(String email, String password, String name) async {
    final result = await _provider.registration(email, password, name);
    if (result.isSuccess) {
      emit(state.copyWith(isRegistration: true));
    } else {
      emit(state.copyWith(isRegistration: false));
    }
  }

  onLogout() async {
    await _provider.logout();
  }
}
