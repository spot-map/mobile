import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ride_map/domain/api/auth_api.dart';
import 'package:ride_map/domain/api/favorite_api.dart';
import 'package:ride_map/domain/api/map_api.dart';
import 'package:ride_map/domain/connection/vpn_checker.dart';
import 'package:ride_map/domain/storage/theme.dart';
import 'package:ride_map/domain/storage/token.dart';
import 'package:ride_map/domain/usecases/api/auth.dart';
import 'package:ride_map/domain/usecases/api/favorite.dart';
import 'package:ride_map/domain/usecases/api/map.dart';
import 'package:ride_map/domain/usecases/connection/vpn_checker.dart';
import 'package:ride_map/domain/usecases/storage/theme/theme.dart';
import 'package:ride_map/domain/usecases/storage/token/tokent.dart';
import 'package:ride_map/presentation/common/cubit/location/cubit.dart';
import 'package:ride_map/presentation/common/cubit/network/cubit.dart';
import 'package:ride_map/presentation/common/cubit/theme/cubit.dart';
import 'package:ride_map/presentation/ui/screens/add_spot/cubit.dart';
import 'package:ride_map/presentation/ui/screens/authorization/cubit.dart';
import 'package:ride_map/presentation/ui/screens/bottom_navigation/cubit.dart';
import 'package:ride_map/presentation/ui/screens/favorite/cubit.dart';
import 'package:ride_map/presentation/ui/screens/map/cubit.dart';
import 'package:ride_map/presentation/ui/screens/spot_by_id/cubit.dart';
import 'package:ride_map/until/dio/dio_client.dart';
import 'package:ride_map/until/dio/interceptors/refresh_interceptor.dart';
import 'package:ride_map/until/dio/interceptors/token_interceptor.dart';

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

  ///Checker
  getIt.registerLazySingleton<VpnChecker>(() => VpnCheckerImpl());

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
