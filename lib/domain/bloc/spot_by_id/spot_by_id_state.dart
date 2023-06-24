part of 'spot_by_id_bloc.dart';

class SpotByIdState extends Equatable {
  const SpotByIdState({
    this.spotById,
    this.status = LocationStateStatus.initial,
    String? errorMessage,
  }) : errorMessage = errorMessage ?? '';

  final LocationStateStatus status;
  final MapByIdModel? spotById;
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage, spotById];

  SpotByIdState copyWith(
      {LocationStateStatus? status, String? errorMessage, MapByIdModel? spotById}) {
    return SpotByIdState(
      errorMessage: errorMessage ?? this.errorMessage,
      spotById: spotById ?? this.spotById,
      status: status ?? this.status,
    );
  }
}
