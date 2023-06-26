part of 'login_bloc.dart';

class LoginState extends Equatable {

  const LoginState({
    this.status = LoginStatus.initial,
    String? errorMessage,
  }) : errorMessage = errorMessage ?? '';

  final LoginStatus status;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        errorMessage,
      ];

  LoginState copyWith({
    LoginStatus? status,
    String? errorMessage,
  }) {
    return LoginState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }
}
