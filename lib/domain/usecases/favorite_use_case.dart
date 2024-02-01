import 'package:ride_map/data/favorite_models/favorite_model.dart';
import 'package:ride_map/domain/api/favorite_api.dart';
import 'package:ride_map/internal/di/inject.dart';


abstract class FavoriteUseCase {
  Future<void> addSpotToFavorite(int id);

  Future<FavoriteModel> getFavoriteList();

  Future<void> deleteSpotFromFavorite(int id);
}

class FavoriteUseCaseImpl implements FavoriteUseCase {
  final FavoriteApi _favoriteApi = getIt();

  @override
  Future<void> addSpotToFavorite(int id) => _favoriteApi.addSpotToFavorite(id);

  @override
  Future<FavoriteModel> getFavoriteList() => _favoriteApi.getFavoriteList();

  @override
  Future<void> deleteSpotFromFavorite(int id) => _favoriteApi.deleteSpotFromFavorite(id);
}
