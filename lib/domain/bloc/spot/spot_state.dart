part of 'spot_bloc.dart';

class SpotState extends Equatable {
  const SpotState({
    this.spot,
    this.status = SpotStatus.initial,
    String? errorMessage,
  }) : errorMessage = errorMessage ?? '';

  final SpotStatus status;
  final MapModel? spot;
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage, spot];

  SpotState copyWith(
      {SpotStatus? status, String? errorMessage, MapModel? spot}) {
    return SpotState(
      errorMessage: errorMessage ?? this.errorMessage,
      spot: spot ?? this.spot,
      status: status ?? this.status,
    );
  }
}
