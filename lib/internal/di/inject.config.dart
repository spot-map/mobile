// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:ride_map/domain/api/provider/favorite_provider.dart' as _i5;
import 'package:ride_map/domain/api/provider/login_provider.dart' as _i3;
import 'package:ride_map/domain/api/provider/map_provider.dart' as _i12;
import 'package:ride_map/domain/api/repository/i_auth_repository.dart' as _i6;
import 'package:ride_map/domain/api/repository/i_favorite_repository.dart'
    as _i8;
import 'package:ride_map/domain/api/repository/i_map_repository.dart' as _i10;
import 'package:ride_map/domain/api/service/favorite_service.dart' as _i9;
import 'package:ride_map/domain/api/service/login_service.dart' as _i7;
import 'package:ride_map/domain/api/service/map_service.dart' as _i11;
import 'package:ride_map/until/dio/dio_client.dart' as _i4;
import 'package:ride_map/until/preferences/preferences.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AuthProvider>(() => _i3.AuthProvider());
    gh.singleton<_i4.DioClient>(_i4.DioClient());
    gh.factory<_i5.FavoriteProvider>(() => _i5.FavoriteProvider());
    gh.factory<_i6.IAuthRepository>(() => _i7.AuthService());
    gh.factory<_i8.IFavoriteRepository>(() => _i9.FavoriteService());
    gh.factory<_i10.IMapRepository>(() => _i11.MapService());
    gh.factory<_i12.MapProvider>(() => _i12.MapProvider());
    gh.singleton<_i13.Prefs>(_i13.Prefs());
    return this;
  }
}
