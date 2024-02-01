part of 'cubit.dart';

class LocationState extends Equatable {
  final String errorMessage;
  final List<MapObject>? mapObject;
  final LatLng? currentPosition;
  final bool isLoading;

  const LocationState( {
    this.mapObject,
    this.isLoading = true,
    this.currentPosition,
    String? errorMessage,
  }) : errorMessage = errorMessage ?? '';


  @override
  List<Object?> get props => [errorMessage,];

  LocationState copyWith(
      {bool? isLoading, LatLng? currentPosition, List<MapObject>? mapObject,  String? errorMessage}) {
    return LocationState(
      currentPosition: currentPosition ?? this.currentPosition,
      isLoading: isLoading ?? this.isLoading,
      mapObject: mapObject ?? this.mapObject,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
