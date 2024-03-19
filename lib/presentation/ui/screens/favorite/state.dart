part of 'cubit.dart';

class FavoriteState extends Equatable {
  final bool isLoading;
  final FavoriteModel? favoriteModel;

  const FavoriteState({
    this.favoriteModel,
    this.isLoading = true,
  });

  @override
  List<Object?> get props => [isLoading, favoriteModel];

  FavoriteState copyWith({bool? isLoading, FavoriteModel? favorite}) {
    return FavoriteState(
      favoriteModel: favorite ?? this.favoriteModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  static const String notAuthorized = 'notAuthorized';
}
