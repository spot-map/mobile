
import 'package:injectable/injectable.dart';
import 'package:ride_map/data/favorite_page_models/favorite_model.dart';
import 'package:ride_map/domain/api/repository/i_favorite_repository.dart';
import 'package:ride_map/domain/api/service/favorite_service.dart';

@injectable
class FavoriteProvider implements IFavoriteRepository{
  final _favoriteService = FavoriteService();
  
  @override
  Future<void> addSpotToFavorite(int id) {
      return _favoriteService.addSpotToFavorite(id);
  }

  @override
  Future<FavoriteModel> getFavoriteList() {
    return _favoriteService.getFavoriteList();
  }
  
}

class NetworkError extends Error {}