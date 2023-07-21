part of 'spot_bloc.dart';

abstract class SpotEvent extends Equatable {
  const SpotEvent();

  @override
  List<Object?> get props => [];
}

class GetSpotList extends SpotEvent {}

class AddSpotEvent extends SpotEvent {
  final String name;
  final String address;
  final String description;
  final double latitude;
  final double longitude;

  const AddSpotEvent(
      this.name, this.address, this.description, this.latitude, this.longitude);

  @override
  List<Object?> get props => [name, address, description, latitude, longitude];
}
