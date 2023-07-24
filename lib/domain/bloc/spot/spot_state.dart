part of 'spot_bloc.dart';

class SpotState extends Equatable {
  const SpotState({
    this.spot,
    this.status = SpotStatus.initial,
    this.spotById,
    this.images,
    String? errorMessage,
  }) : errorMessage = errorMessage ?? '';

  final SpotStatus status;
  final MapModel? spot;
  final MapByIdModel? spotById;
  final String errorMessage;
  final List<XFile>? images;

  @override
  List<Object?> get props => [spot, spotById, images];

  SpotState copyWith(
      {SpotStatus? status,
      String? errorMessage,
      MapModel? spot,
      MapByIdModel? spotById,
      List<XFile>? images}) {
    return SpotState(
        errorMessage: errorMessage ?? this.errorMessage,
        spot: spot ?? this.spot,
        spotById: spotById ?? this.spotById,
        status: status ?? this.status,
        images: images ?? this.images);
  }
}
