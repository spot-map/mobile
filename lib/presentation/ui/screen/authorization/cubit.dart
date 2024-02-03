import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ride_map/domain/usecases/api/auth.dart';
import 'package:ride_map/internal/di/inject.dart';

part 'state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUseCase _authUseCase = getIt();

  Stream<String> get messageStream => _messageController.stream;
  final _messageController = StreamController<String>();

  AuthCubit() : super(const AuthState());

  onLogin(String email, String password) async {
    final result = await _authUseCase.login(email, password);
    if (result.isSuccess) {
      _messageController.add(AuthState.successLogin);
    } else {
      _messageController.add(AuthState.failureLogin);
    }
    emit(state.copyWith(isLogin: result.value));
  }

  onRegistration(String email, String password, String name) async {
    final result = await _authUseCase.registration(email, password, name);
    if (result.isSuccess) {
      _messageController.add(AuthState.successRegistration);
    } else {
      _messageController.add(AuthState.failureRegistration);
    }
    emit(state.copyWith(isRegistration: result.value));
  }

  onLogout() async {
    await _authUseCase.logout();
  }
}
