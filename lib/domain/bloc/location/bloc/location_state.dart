part of 'location_bloc.dart';


extension LocationStateStatusX on LocationStateStatus {
  bool get isInitial => this == LocationStateStatus.initial;
  bool get isSuccess => this == LocationStateStatus.success;
  bool get isError => this == LocationStateStatus.error;
  bool get isLoading => this == LocationStateStatus.loading;
}

class LocationState extends Equatable {
  const LocationState( {
    this.status = LocationStateStatus.initial,
    LatLng? initLocation,
    CurrentUserLocationEntity? currentUserLocation,
    String? errorMessage,
     this.mapObjects
    // SpotModel? spot
  })  : currentUserLocation =
      currentUserLocation ?? CurrentUserLocationEntity.empty,
        initLocation = initLocation ?? const LatLng(40.4167, -3.70325),
        errorMessage = errorMessage ?? '';

  final LocationStateStatus status;
  final CurrentUserLocationEntity currentUserLocation;
  final List<MapObject>? mapObjects;
  final LatLng initLocation;
  final String errorMessage;

  @override
  List<Object?> get props => [
    status,
    currentUserLocation,
    initLocation,
    errorMessage,
    mapObjects
  ];

  LocationState copyWith({
    LocationStateStatus? status,
    CurrentUserLocationEntity? currentUserLocation,
    LatLng? initLocation,
    Location? location,
    String? errorMessage,
    List<MapObject>? mapObjects
  }) {
    return LocationState(
      status: status ?? this.status,
      currentUserLocation: currentUserLocation ?? this.currentUserLocation,
      initLocation: initLocation ?? this.initLocation,
      errorMessage: errorMessage ?? this.errorMessage,
      mapObjects:  mapObjects ?? this.mapObjects
    );
  }
}
