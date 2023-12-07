import 'package:ride_map/data/favorite_page_models/favorite_model.dart';

abstract class IFavoriteRepository {
  Future<void> addSpotToFavorite(int id);

  Future<FavoriteModel> getFavoriteList();

  Future<void> deleteSpotFromFavorite(int id);
}
