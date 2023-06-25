part of 'spot_by_id_bloc.dart';

class SpotByIdState extends Equatable {
  const SpotByIdState({
    this.spotById,
    this.status = ByIdStatus.initial,
    String? errorMessage,
  }) : errorMessage = errorMessage ?? '';

  final ByIdStatus status;
  final MapByIdModel? spotById;
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage, spotById];

  SpotByIdState copyWith(
      {ByIdStatus? status, String? errorMessage, MapByIdModel? spotById}) {
    return SpotByIdState(
      errorMessage: errorMessage ?? this.errorMessage,
      spotById: spotById ?? this.spotById,
      status: status ?? this.status,
    );
  }
}
