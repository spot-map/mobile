part of 'cubit.dart';

class FavoriteState extends Equatable {
  final bool isLoading;
  final FavoriteModel? favoriteModel;
  final String errorMessage;

  const FavoriteState({
    this.favoriteModel,
    this.isLoading = true,
    String? errorMessage,
  }) : errorMessage = errorMessage ?? '';

  @override
  List<Object?> get props => [isLoading, errorMessage, favoriteModel];

  FavoriteState copyWith({bool? isLoading, String? errorMessage, FavoriteModel? favorite}) {
    return FavoriteState(
      errorMessage: errorMessage ?? this.errorMessage,
      favoriteModel: favorite ?? this.favoriteModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  static const String notAuthorized = 'addedToFavorite';
}
