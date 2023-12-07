import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:ride_map/domain/api/provider/favorite_provider.dart';
import 'package:ride_map/domain/api/provider/auth_provider.dart';
import 'package:ride_map/domain/api/provider/map_provider.dart';
import 'package:ride_map/domain/api/repository/i_auth_repository.dart';
import 'package:ride_map/domain/api/repository/i_favorite_repository.dart';
import 'package:ride_map/domain/api/repository/i_map_repository.dart';
import 'package:ride_map/domain/api/service/favorite_service.dart';
import 'package:ride_map/domain/api/service/login_service.dart';
import 'package:ride_map/domain/api/service/map_service.dart';
import 'package:ride_map/domain/bloc/add_spot/add_spot_cubit.dart';
import 'package:ride_map/domain/bloc/auth/auth_cubit.dart';
import 'package:ride_map/domain/bloc/favorite/favorite_cubit.dart';
import 'package:ride_map/domain/bloc/location/location_cubit.dart';
import 'package:ride_map/domain/bloc/navigation/navigation_cubit.dart';
import 'package:ride_map/domain/bloc/spot/map_cubit.dart';
import 'package:ride_map/domain/bloc/spot_by_id/spot_by_id_cubit.dart';
import 'package:ride_map/domain/bloc/theme/theme_cubit.dart';
import 'package:ride_map/until/dio/dio_client.dart';
import 'package:ride_map/until/preferences/preferences.dart';

final getIt = GetIt.instance;

void registerGetIt() {
  ///Provider
  getIt.registerLazySingleton<AuthProvider>(() => AuthProviderImpl());
  getIt.registerLazySingleton<MapProvider>(() => MapProviderImpl());
  getIt.registerLazySingleton<FavoriteProvider>(() => FavoriteProviderImpl());

  ///Repository
  getIt.registerLazySingleton<IAuthRepository>(() => AuthService());
  getIt.registerLazySingleton<IMapRepository>(() => MapService());
  getIt.registerLazySingleton<IFavoriteRepository>(() => FavoriteService());

  ///Api Client
  getIt.registerLazySingleton(() => DioClient());

  ///Preferences
  getIt.registerLazySingleton(() => Prefs());

  ///Cubits
  getIt.registerFactoryParam((int id, _) => SpotByIdCubit(id: id));
  getIt.registerFactory(() => NavigationCubit());
  getIt.registerFactory(() => FavoriteCubit());
  getIt.registerFactory(() => AuthCubit());
  getIt.registerFactory(() => LocationCubit());
  getIt.registerFactory(() => AddSpotCubit());
  getIt.registerFactory(() => MapCubit());
  getIt.registerFactory(() => ThemeCubit(isDark: Prefs.getBool('theme')!));
}
