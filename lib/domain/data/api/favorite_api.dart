import 'package:ride_map/domain/entities/favorite_models/favorite_model.dart';

abstract class FavoriteApi {
  Future<bool> add(int id);

  Future<FavoriteModel> get();

  Future<bool> delete(int id);
}
