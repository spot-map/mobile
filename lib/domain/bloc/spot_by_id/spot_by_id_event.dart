part of 'spot_by_id_bloc.dart';

abstract class SpotByIdEvent extends Equatable {
  const SpotByIdEvent();

  @override
  List<Object?> get props => [];
}

class GetSpotById extends SpotByIdEvent {
  final int id;

  const GetSpotById(this.id);

  @override
  List<Object?> get props => [id];
}

class SendReactions extends SpotByIdEvent {
  final String text;
  final double score;
  final int spotId;

  const SendReactions(this.text, this.score, this.spotId);

  @override
  List<Object?> get props => [text, score, spotId];
}
