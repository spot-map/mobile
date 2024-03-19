import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ride_map/core/di/inject.dart';
import 'package:ride_map/domain/usecases/auth/auth.dart';
import 'package:ride_map/domain/entities/common/validator.dart';

part 'state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUseCase _authUseCase = getIt();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailRegistrationController = TextEditingController();
  final TextEditingController passwordRegistrationController = TextEditingController();

  Stream<String> get messageStream => _messageController.stream;
  final _messageController = StreamController<String>();

  AuthCubit() : super(AuthState());

  onLogin() async {
    if (state.email.isEmpty && state.password.isEmpty) {
      final emailError = TextValidators.email(state.email);
      final passwordError = TextValidators.password(state.password);
      emit(state.copyWith(emailError: emailError, passwordError: passwordError));
      return;
    }
    if (state.emailError != null && state.passwordError != null) return;
    final result = await _authUseCase.login(state.email, state.password);
    if (result.isSuccess) {
      _messageController.add(AuthState.successLogin);
    } else {
      _messageController.add(AuthState.failureLogin);
    }
  }

  onRegistration() async {
    if (state.name.isEmpty && state.emailRegistration.isEmpty && state.passwordRegistration.isEmpty) {
      final nameError = TextValidators.name(state.name);
      final emailError = TextValidators.email(state.emailRegistration);
      final passwordError = TextValidators.password(state.passwordRegistration);
      emit(state.copyWith(
          emailRegistrationError: emailError, passwordRegistrationError: passwordError, nameError: nameError));
      return;
    }
    if (state.nameError != null && state.emailRegistrationError != null && state.passwordRegistrationError != null)
      return;
    final result = await _authUseCase.registration(state.email, state.password, state.name);
    if (result.isSuccess) {
      _messageController.add(AuthState.successRegistration);
    } else {
      _messageController.add(AuthState.failureRegistration);
    }
  }

  onNameChanged(String name) {
    state.name = name;
    final newError = TextValidators.name(name);
    if (state.nameError != newError) {
      emit(state.copyWith(nameError: newError));
    }
  }

  onEmailChanged(String email) {
    state.email = email;
    final newError = TextValidators.email(email);
    if (state.emailError != newError) {
      emit(state.copyWith(emailError: newError));
    }
  }

  onEmailRegistrationChanged(String email) {
    state.emailRegistration = email;
    final newError = TextValidators.email(email);
    if (state.emailRegistrationError != newError) {
      emit(state.copyWith(emailRegistrationError: newError));
    }
  }

  onPasswordChanged(String password) {
    state.password = password;
    final newError = TextValidators.password(password);
    if (state.passwordError != newError) {
      emit(state.copyWith(passwordError: newError));
    }
  }

  onPasswordRegistrationChanged(String password) {
    state.passwordRegistration = password;
    final newError = TextValidators.password(password);
    if (state.passwordRegistrationError != newError) {
      emit(state.copyWith(passwordRegistrationError: newError));
    }
  }

  onLogout() async {
    await _authUseCase.logout();
  }

  @override
  Future<void> close() {
    _messageController.close();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    emailRegistrationController.dispose();
    passwordRegistrationController.dispose();
    return super.close();
  }
}
