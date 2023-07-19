
import 'package:injectable/injectable.dart';
import 'package:ride_map/data/favorite_page_models/favorite_model.dart';
import 'package:ride_map/domain/api/repository/i_favorite_repository.dart';
import 'package:ride_map/internal/di/inject.dart';

@injectable
class FavoriteProvider {
  final _favoriteService = getIt.get<IFavoriteRepository>();
  
  Future<void> addSpotToFavorite(int id) {
      return _favoriteService.addSpotToFavorite(id);
  }

  Future<FavoriteModel> getFavoriteList() {
    return _favoriteService.getFavoriteList();
  }

  Future<void> deleteSpotFromFavorite(int id){
    return _favoriteService.deleteSpotFromFavorite(id);
  }
}

class NetworkError extends Error {}