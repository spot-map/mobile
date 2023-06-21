part of 'spot_bloc.dart';

class SpotState extends Equatable {
  const SpotState( {
    this.spot,
    this.status = LocationStateStatus.initial,
    String? errorMessage,
  })  : errorMessage = errorMessage ?? '';

  final LocationStateStatus status;
  final MapModel? spot;
  final String errorMessage;

  @override
  List<Object?> get props => [
    errorMessage,
    spot
  ];

  SpotState copyWith({
    LocationStateStatus? status,
    String? errorMessage,
    MapModel? spot
  }) {
    return SpotState(
      errorMessage: errorMessage ?? this.errorMessage,
      spot: spot ?? this.spot,
      status: status ?? this.status,
    );
  }
}