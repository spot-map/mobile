import 'dart:developer';
import 'package:ride_map/core/di/inject.dart';
import 'package:ride_map/domain/data/api/favorite_api.dart';
import 'package:ride_map/domain/entities/favorite_models/favorite_model.dart';
import 'package:ride_map/domain/entities/common/result.dart';

abstract class FavoriteUseCase {
  Future<Result<bool>> add(int id);

  Future<Result<FavoriteModel>> get();

  Future<Result<bool>> delete(int id);
}

class FavoriteUseCaseImpl implements FavoriteUseCase {
  final FavoriteApi _favoriteApi = getIt();

  @override
  Future<Result<bool>> add(int id) async {
    late final bool added;
    try {
      added = await _favoriteApi.add(id);
    } catch (e, s) {
      log('$e, $s', name: "addToFavorite");
      return Result.failure("Не удалось добавить спот в избранного.");
    }
    return Result.success(added);
  }

  @override
  Future<Result<FavoriteModel>> get() async {
    late final FavoriteModel favorite;
    try {
      favorite = await _favoriteApi.get();
    } catch (e, s) {
      log('$e, $s', name: 'favorite');
      return Result.failure('Не удалось получить Избранное.');
    }
    return Result.success(favorite);
  }

  @override
  Future<Result<bool>> delete(int id) async {
    late final bool deleted;
    try {
      deleted = await _favoriteApi.delete(id);
    } catch (e, s) {
      log('$e, $s', name: "deleteFromFavorite");
      return Result.failure("Не удалось удалить спот из избранного.");
    }
    return Result.success(deleted);
  }
}
