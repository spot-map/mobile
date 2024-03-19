import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ride_map/data/api/auth.dart';
import 'package:ride_map/data/api/favorite.dart';
import 'package:ride_map/data/api/map.dart';
import 'package:ride_map/data/clients/client.dart';
import 'package:ride_map/data/clients/interceptors/token_interceptor.dart';
import 'package:ride_map/data/storage/theme.dart';
import 'package:ride_map/data/storage/token.dart';
import 'package:ride_map/domain/data/api/auth_api.dart';
import 'package:ride_map/domain/data/api/favorite_api.dart';
import 'package:ride_map/domain/data/api/map_api.dart';
import 'package:ride_map/domain/data/storage/theme/theme.dart';
import 'package:ride_map/domain/data/storage/token/token.dart';
import 'package:ride_map/domain/usecases/auth/auth.dart';
import 'package:ride_map/domain/usecases/connection/vpn_checker.dart';
import 'package:ride_map/domain/usecases/favorite/favorite.dart';
import 'package:ride_map/domain/usecases/map/map.dart';
import 'package:ride_map/presentation/common/cubit/location/cubit.dart';
import 'package:ride_map/presentation/common/cubit/network/cubit.dart';
import 'package:ride_map/presentation/common/cubit/theme/cubit.dart';
import 'package:ride_map/presentation/ui/screens/add_spot/cubit.dart';
import 'package:ride_map/presentation/ui/screens/authorization/cubit.dart';
import 'package:ride_map/presentation/ui/screens/bottom_navigation/cubit.dart';
import 'package:ride_map/presentation/ui/screens/favorite/cubit.dart';
import 'package:ride_map/presentation/ui/screens/map/cubit.dart';
import 'package:ride_map/presentation/ui/screens/spot_by_id/cubit.dart';

final getIt = GetIt.instance;

Future registerGetIt() async {
  ///Use cases
  getIt.registerLazySingleton<AuthUseCase>(() => AuthUseCaseImpl());
  getIt.registerLazySingleton<MapUseCase>(() => MapUseCaseImpl());
  getIt.registerLazySingleton<FavoriteUseCase>(() => FavoriteUseCaseImpl());
  getIt.registerLazySingleton<VpnCheckerUseCase>(() => VpnCheckerUseCaseImpl());

  ///Api
  getIt.registerLazySingleton<AuthApi>(() => AuthApiImpl());
  getIt.registerLazySingleton<MapApi>(() => MapApiImpl());
  getIt.registerLazySingleton<FavoriteApi>(() => FavoriteApiImpl());

  ///Storage
  getIt.registerLazySingleton<TokenStorage>(() => TokenStorageUseCaseImpl());
  getIt.registerLazySingleton<ThemeStorage>(() => ThemeStorageUseCaseImpl());

  ///Api Client
  getIt.registerLazySingleton<Client>(() => Client());
  getIt.registerLazySingleton<Dio>(() => getIt<Client>().create());
  getIt.registerLazySingleton<TokenInterceptor>(() => TokenInterceptor());

  ///Cubits
  getIt.registerFactoryParam((int id, _) => SpotByIdCubit(id: id));
  getIt.registerFactory(() => NavigationCubit());
  getIt.registerFactory(() => FavoriteCubit());
  getIt.registerFactory(() => AuthCubit());
  getIt.registerFactory(() => LocationCubit());
  getIt.registerFactory(() => AddSpotCubit());
  getIt.registerFactory(() => MapCubit());
  getIt.registerFactory(() => NetworkCubit());
  getIt.registerFactory(() => ThemeCubit(isDark: getIt<ThemeStorage>().theme ?? false));
}
