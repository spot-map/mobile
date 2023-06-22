part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  const RegistrationState({
    this.status = LocationStateStatus.initial,
    String? errorMessage,
  }) : errorMessage = errorMessage ?? '';

  final LocationStateStatus status;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        errorMessage,
      ];

  RegistrationState copyWith({
    LocationStateStatus? status,
    String? errorMessage,
  }) {
    return RegistrationState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }
}
