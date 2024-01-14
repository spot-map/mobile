part of 'cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    this.isLogin,
    this.isRegistration,
    String? errorMessage,
  }) : errorMessage = errorMessage ?? '';

  final bool? isLogin;
  final bool? isRegistration;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        isRegistration,
        isLogin,
        errorMessage,
      ];

  AuthState copyWith({
    bool? isLogin,
    bool? isRegistration,
    String? errorMessage,
  }) {
    return AuthState(
        errorMessage: errorMessage ?? this.errorMessage,
        isLogin: isLogin ?? this.isLogin,
        isRegistration: isRegistration ?? this.isRegistration);
  }


  static const String successLogin = 'successLogin';
  static const String failureLogin = 'failureLogin';
  static const String successRegistration = 'successRegistration';
  static const String failureRegistration = 'failureRegistration';
}
