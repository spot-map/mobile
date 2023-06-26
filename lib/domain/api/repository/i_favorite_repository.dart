import 'package:injectable/injectable.dart';
import 'package:ride_map/data/favorite_page_models/favorite_model.dart';

abstract class IFavoriteRepository{
  @module
  Future<void> addSpotToFavorite(int id);

  @module
  Future<FavoriteModel> getFavoriteList();
}