part of 'spot_bloc.dart';

abstract class SpotState extends Equatable {
  const SpotState();
}

class SpotInitial extends SpotState {
  @override
  List<Object> get props => [];
}
