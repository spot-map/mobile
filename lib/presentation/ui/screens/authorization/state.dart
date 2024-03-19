// ignore_for_file: must_be_immutable

part of 'cubit.dart';

class AuthState extends Equatable {
  AuthState(
      {this.emailError,
      this.email = "",
      this.password = "",
      this.passwordError,
      this.emailRegistrationError,
      this.passwordRegistrationError,
      this.emailRegistration = "",
      this.passwordRegistration = "",
      this.nameError,
      this.name = ""});

  final String? emailError;
  final String? emailRegistrationError;
  final String? passwordError;
  final String? passwordRegistrationError;
  final String? nameError;
  String name;
  String emailRegistration;
  String email;
  String password;
  String passwordRegistration;

  @override
  List<Object?> get props => [
        emailError,
        email,
        password,
        passwordError,
        name,
        nameError,
        passwordRegistrationError,
        passwordRegistration,
        emailRegistration,
        emailRegistrationError
      ];

  AuthState copyWith(
      {bool? isLogin,
      bool? isRegistration,
      String? emailError,
      String? passwordError,
      String? nameError,
      String? name,
      String? email,
      String? password,
      String? emailRegistrationError,
      String? passwordRegistrationError,
      String? passwordRegistration,
      String? emailRegistration}) {
    return AuthState(
        emailError: emailError ?? this.emailError,
        email: email ?? this.email,
        password: password ?? this.password,
        passwordError: passwordError ?? this.passwordError,
        name: name ?? this.name,
        nameError: nameError ?? this.nameError,
        passwordRegistration: passwordRegistration ?? this.passwordRegistration,
        emailRegistration: emailRegistration ?? this.emailRegistration,
        emailRegistrationError: emailRegistrationError ?? this.emailRegistrationError,
        passwordRegistrationError: passwordRegistrationError ?? this.passwordRegistrationError);
  }

  static const String successLogin = 'successLogin';
  static const String failureLogin = 'failureLogin';
  static const String successRegistration = 'successRegistration';
  static const String failureRegistration = 'failureRegistration';
}
