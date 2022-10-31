part of 'spot_bloc.dart';

abstract class SpotEvent extends Equatable {
  const SpotEvent();

  @override
  List<Object?> get props => [];
}

class GetSpots extends SpotEvent{}
