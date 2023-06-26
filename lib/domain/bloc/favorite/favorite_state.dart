part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  const FavoriteState({
    this.favoriteModel,
    this.status = FavoriteStatus.initial,
    String? errorMessage,
  }) : errorMessage = errorMessage ?? '';

  final FavoriteStatus status;
  final FavoriteModel? favoriteModel;
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage, favoriteModel];

  FavoriteState copyWith(
      {FavoriteStatus? status, String? errorMessage, FavoriteModel? favorite}) {
    return FavoriteState(
      errorMessage: errorMessage ?? this.errorMessage,
      favoriteModel: favorite ?? this.favoriteModel,
      status: status ?? this.status,
    );
  }
}