import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ride_map/domain/api/auth_api.dart';
import 'package:ride_map/domain/api/favorite_api.dart';
import 'package:ride_map/domain/api/map_api.dart';
import 'package:ride_map/domain/connection/vpn_checker.dart';
import 'package:ride_map/domain/storage/token_storage.dart';
import 'package:ride_map/domain/usecases/api_usecases/auth_usecase.dart';
import 'package:ride_map/domain/usecases/api_usecases/favorite_usecase.dart';
import 'package:ride_map/domain/usecases/api_usecases/map_usecase.dart';
import 'package:ride_map/domain/usecases/connection_usecases/vpn_checker_usecase.dart';
import 'package:ride_map/domain/usecases/storage_usecases/storage_usecase.dart';
import 'package:ride_map/presentation/common/cubit/location/cubit.dart';
import 'package:ride_map/presentation/common/cubit/navigation/cubit.dart';
import 'package:ride_map/presentation/common/cubit/network/cubit.dart';
import 'package:ride_map/presentation/common/cubit/spot/cubit.dart';
import 'package:ride_map/presentation/common/cubit/theme/cubit.dart';
import 'package:ride_map/presentation/ui/screen/add_spot/cubit.dart';
import 'package:ride_map/presentation/ui/screen/authorization/cubit.dart';
import 'package:ride_map/presentation/ui/screen/favorite/cubit.dart';
import 'package:ride_map/presentation/ui/screen/spot_by_id/cubit.dart';
import 'package:ride_map/until/dio/dio_client.dart';
import 'package:ride_map/until/preferences/preferences.dart';

final getIt = GetIt.instance;

Future registerGetIt() async {
  ///Use cases
  getIt.registerLazySingleton<AuthUseCase>(() => AuthUseCaseImpl());
  getIt.registerLazySingleton<MapUseCase>(() => MapUseCaseImpl());
  getIt.registerLazySingleton<FavoriteUseCase>(() => FavoriteUseCaseImpl());
  getIt.registerLazySingleton<VpnCheckerUseCase>(() => VpnCheckerUseCaseImpl());
  getIt.registerLazySingleton<TokenStorageUseCase>(() => TokenStorageUseCaseImpl());


  ///Api
  getIt.registerLazySingleton<AuthApi>(() => AuthApiImpl());
  getIt.registerLazySingleton<MapApi>(() => MapApiImpl());
  getIt.registerLazySingleton<FavoriteApi>(() => FavoriteApiImpl());

  getIt.registerLazySingleton<VpnChecker>(() => VpnCheckerImpl());

  getIt.registerLazySingleton<TokenStorage>(() => TokenStorageImpl());


  ///Api Client
  getIt.registerLazySingleton<Client>(() => Client());
  getIt.registerLazySingleton<Dio>(() => getIt<Client>().create());

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
  getIt.registerFactory(() => NetworkCubit());
  getIt.registerFactory(() => ThemeCubit(isDark: Prefs.getBool('theme')!));

}

Future<void> initPreferences() async {
  await Prefs.init();
  if (Prefs.getBool('theme') == null) {
    Prefs.setBool('theme', false);
  }
}
