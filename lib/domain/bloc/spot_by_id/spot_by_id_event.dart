part of 'spot_by_id_bloc.dart';

abstract class SpotByIdEvent extends Equatable {
  const SpotByIdEvent();

  @override
  List<Object?> get props => [];
}

class GetSpotById extends SpotByIdEvent{
  final int id;

  const GetSpotById(this.id);

  @override
  List<Object?> get props => [id];
}

class AddSpotToFavoriteEvent extends SpotByIdEvent{
  final int id;

 const AddSpotToFavoriteEvent(this.id);

  @override
  List<Object?> get props => [id];
}
