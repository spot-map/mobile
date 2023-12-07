import 'package:ride_map/data/favorite_page_models/favorite_model.dart';
import 'package:ride_map/domain/api/repository/i_favorite_repository.dart';
import 'package:ride_map/internal/di/inject.dart';

abstract class FavoriteProvider {
  Future<void> addSpotToFavorite(int id);

  Future<FavoriteModel> getFavoriteList();

  Future<void> deleteSpotFromFavorite(int id);
}

class FavoriteProviderImpl implements FavoriteProvider {
  final IFavoriteRepository _favoriteRepository = getIt();

  @override
  Future<void> addSpotToFavorite(int id) => _favoriteRepository.addSpotToFavorite(id);

  @override
  Future<FavoriteModel> getFavoriteList() => _favoriteRepository.getFavoriteList();

  @override
  Future<void> deleteSpotFromFavorite(int id) => _favoriteRepository.deleteSpotFromFavorite(id);
}
