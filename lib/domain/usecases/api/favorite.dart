import 'dart:developer';

import 'package:ride_map/data/favorite_models/favorite_model.dart';
import 'package:ride_map/data/result_entity/result.dart';
import 'package:ride_map/domain/api/favorite_api.dart';
import 'package:ride_map/internal/di/inject.dart';

abstract class FavoriteUseCase {
  Future<Result<bool>> addSpotToFavorite(int id);

  Future<Result<FavoriteModel>> getFavoriteList();

  Future<Result<bool>> deleteSpotFromFavorite(int id);
}

class FavoriteUseCaseImpl implements FavoriteUseCase {
  final FavoriteApi _favoriteApi = getIt();

  @override
  Future<Result<bool>> addSpotToFavorite(int id) async{
    late final bool added;
    try{
      added = await _favoriteApi.addSpotToFavorite(id);
    }catch(e,s){
      log('$e, $s', name: "addToFavorite");
      return Result.failure("Не удалось добавить спот в избранного.");
    }
    return Result.success(added);
  }

  @override
  Future<Result<FavoriteModel>> getFavoriteList() async {
    late final FavoriteModel favorite;
    try {
      favorite = await _favoriteApi.getFavoriteList();
    } catch (e, s) {
      log('$e, $s', name: 'favorite');
      return Result.failure('Не удалось получить Избранное.');
    }
    return Result.success(favorite);
  }

  @override
  Future<Result<bool>> deleteSpotFromFavorite(int id) async {
    late final bool deleted;
    try {
      deleted = await _favoriteApi.deleteSpotFromFavorite(id);
    } catch (e, s) {
      log('$e, $s', name: "deleteFromFavorite");
      return Result.failure("Не удалось удалить спот из избранного.");
    }
    return Result.success(deleted);
  }
}
