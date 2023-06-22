part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = LocationStateStatus.initial,
    String? errorMessage,
  }) : errorMessage = errorMessage ?? '';

  final LocationStateStatus status;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        errorMessage,
      ];

  LoginState copyWith({
    LocationStateStatus? status,
    String? errorMessage,
  }) {
    return LoginState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }
}
