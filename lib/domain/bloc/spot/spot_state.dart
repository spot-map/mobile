part of 'spot_bloc.dart';

class SpotState extends Equatable {
  const SpotState({
    this.spot,
    this.status = SpotStatus.initial,
    this.mapById,
    this.images,
    String? errorMessage,
  }) : errorMessage = errorMessage ?? '';

  final SpotStatus status;
  final MapModel? spot;
  final MapByIdModel? mapById;
  final String errorMessage;
  final List<XFile>? images;

  @override
  List<Object?> get props => [errorMessage, spot, images];

  SpotState copyWith(
      {SpotStatus? status,
      String? errorMessage,
      MapModel? spot,
      MapByIdModel? mapById,
      List<XFile>? images}) {
    return SpotState(
        errorMessage: errorMessage ?? this.errorMessage,
        spot: spot ?? this.spot,
        mapById: mapById ?? this.mapById,
        status: status ?? this.status,
        images: images ?? this.images);
  }
}
