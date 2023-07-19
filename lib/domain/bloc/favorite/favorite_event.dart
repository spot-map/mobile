part of 'favorite_bloc.dart';

class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object?> get props => [];

}

class GetFavoriteSpotsEvent extends FavoriteEvent{}

class AddSpotToFavoriteEvent extends FavoriteEvent{
  final int id;

  const AddSpotToFavoriteEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class DeleteSpotFromFavoriteEvent extends FavoriteEvent{
  final int id;

  const DeleteSpotFromFavoriteEvent(this.id);

  @override
  List<Object?> get props => [id];
}