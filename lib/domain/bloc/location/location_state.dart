part of 'location_bloc.dart';

extension LocationStateStatusX on LocationStateStatus {
  bool get isInitial => this == LocationStateStatus.initial;

  bool get isSuccess => this == LocationStateStatus.success;

  bool get isError => this == LocationStateStatus.error;

  bool get isLoading => this == LocationStateStatus.loading;
}

class LocationState extends Equatable {
  const LocationState({
    this.status = LocationStateStatus.initial,
    LatLng? initLocation,
    CurrentUserLocationEntity? currentUserLocation,
    this.spot,
    String? errorMessage,
  })  : currentUserLocation =
            currentUserLocation ?? CurrentUserLocationEntity.empty,
        errorMessage = errorMessage ?? '';

  final LocationStateStatus status;
  final CurrentUserLocationEntity currentUserLocation;
  final MapModel? spot;
  final String errorMessage;

  @override
  List<Object?> get props =>
      [status, currentUserLocation, errorMessage, spot];

  LocationState copyWith(
      {LocationStateStatus? status,
      CurrentUserLocationEntity? currentUserLocation,
      LatLng? initLocation,
      Location? location,
      String? errorMessage,
      MapModel? spot}) {
    return LocationState(
      status: status ?? this.status,
      currentUserLocation: currentUserLocation ?? this.currentUserLocation,
      initLocation: initLocation,
      errorMessage: errorMessage ?? this.errorMessage,
      spot: spot ?? this.spot,
    );
  }
}
