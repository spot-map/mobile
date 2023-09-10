import 'package:injectable/injectable.dart';
import 'package:ride_map/data/favorite_page_models/favorite_model.dart';
import 'package:ride_map/domain/api/repository/i_auth_repository.dart';
import 'package:ride_map/domain/api/repository/i_favorite_repository.dart';
import 'package:ride_map/internal/di/inject.dart';

@injectable
class FavoriteProvider {
  final _favoriteRepository = getIt.get<IFavoriteRepository>();
  final _authRepository = getIt.get<IAuthRepository>();

  Future<void> addSpotToFavorite(int id) => _favoriteRepository.addSpotToFavorite(id);

  Future<FavoriteModel> getFavoriteList() => _favoriteRepository.getFavoriteList();

  Future<void> deleteSpotFromFavorite(int id) => _favoriteRepository.deleteSpotFromFavorite(id);

  Future<void> logout() => _authRepository.logout();
}

class NetworkError extends Error {}
