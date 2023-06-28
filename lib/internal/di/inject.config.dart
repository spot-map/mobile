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
import 'package:location_repository/location_repository.dart' as _i12;
import 'package:ride_map/data/favorite_page_models/favorite_model.dart' as _i6;
import 'package:ride_map/data/map_page_models/map_model.dart' as _i13;
import 'package:ride_map/domain/api/provider/favorite_provider.dart' as _i7;
import 'package:ride_map/domain/api/provider/login_provider.dart' as _i3;
import 'package:ride_map/domain/api/provider/map_provider.dart' as _i15;
import 'package:ride_map/domain/api/repository/i_map_repository.dart' as _i9;
import 'package:ride_map/domain/api/service/favorite_service.dart' as _i8;
import 'package:ride_map/domain/api/service/login_service.dart' as _i4;
import 'package:ride_map/domain/api/service/map_service.dart' as _i10;
import 'package:ride_map/domain/bloc/favorite/favorite_bloc.dart' as _i5;
import 'package:ride_map/domain/bloc/location/location_bloc.dart' as _i11;
import 'package:ride_map/domain/bloc/login/login_bloc.dart' as _i14;
import 'package:ride_map/domain/bloc/navigation/navigation_cubit.dart' as _i16;
import 'package:ride_map/domain/bloc/spot/spot_bloc.dart' as _i18;
import 'package:ride_map/untils/preferences/preferences.dart' as _i17;

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
    gh.factory<_i4.AuthService>(() => _i4.AuthService());
    gh.factory<_i5.FavoriteBloc>(
        () => _i5.FavoriteBloc(model: gh<_i6.FavoriteModel>()));
    gh.factory<_i7.FavoriteProvider>(() => _i7.FavoriteProvider());
    gh.factory<_i8.FavoriteService>(() => _i8.FavoriteService());
    gh.factory<_i9.IMapRepository>(() => _i10.MapService());
    gh.factory<_i11.LocationBloc>(() => _i11.LocationBloc(
          locationRepository: gh<_i12.LocationRepository>(),
          spot: gh<_i13.MapModel>(),
        ));
    gh.factory<_i14.LoginBloc>(() => _i14.LoginBloc());
    gh.factory<_i15.MapProvider>(() => _i15.MapProvider());
    gh.factory<_i16.NavigationCubit>(() => _i16.NavigationCubit());
    gh.singleton<_i17.Prefs>(_i17.Prefs());
    gh.factory<_i18.SpotBloc>(() => _i18.SpotBloc(spot: gh<_i13.MapModel>()));
    return this;
  }
}
