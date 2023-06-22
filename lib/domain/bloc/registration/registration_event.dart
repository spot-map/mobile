part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object?> get props => [];
}

class RegistrationUserEvent extends RegistrationEvent {
  final String email;
  final String name;
  final String password;

  const RegistrationUserEvent(this.email, this.name, this.password);

  @override
  List<Object?> get props => [email, name, password];
}
