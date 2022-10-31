part of 'spot_bloc.dart';

abstract class SpotState extends Equatable {
  const SpotState();

  @override
  List<Object> get props => [];
}

class SpotInitial extends SpotState {}

class SpotLoading extends SpotState {}

class SpotLoaded extends SpotState {
  final SpotModel spot;

 const SpotLoaded(this.spot);

  @override
  List<Object> get props => [spot];
}

class SpotError extends SpotState{
  final String? message;

  const SpotError(this.message);
}
