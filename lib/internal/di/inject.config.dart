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
import 'package:location_repository/location_repository.dart' as _i11;
import 'package:ride_map/data/favorite_page_models/favorite_model.dart' as _i5;
import 'package:ride_map/data/map_page_models/map_model.dart' as _i12;
import 'package:ride_map/domain/api/provider/login_provider.dart' as _i3;
import 'package:ride_map/domain/api/provider/map_provider.dart' as _i14;
import 'package:ride_map/domain/api/repository/i_auth_repository.dart' as _i6;
import 'package:ride_map/domain/api/repository/i_map_repository.dart' as _i8;
import 'package:ride_map/domain/api/service/login_service.dart' as _i7;
import 'package:ride_map/domain/api/service/map_service.dart' as _i9;
import 'package:ride_map/domain/bloc/favorite/favorite_bloc.dart' as _i4;
import 'package:ride_map/domain/bloc/location/location_bloc.dart' as _i10;
import 'package:ride_map/domain/bloc/login/login_bloc.dart' as _i13;
import 'package:ride_map/domain/bloc/navigation/navigation_cubit.dart' as _i15;
import 'package:ride_map/domain/bloc/spot/spot_bloc.dart' as _i17;
import 'package:ride_map/untils/preferences/preferences.dart' as _i16;

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
    gh.factory<_i4.FavoriteBloc>(
        () => _i4.FavoriteBloc(model: gh<_i5.FavoriteModel>()));
    gh.factory<_i6.IAuthRepository>(() => _i7.AuthService());
    gh.factory<_i8.IMapRepository>(() => _i9.MapService());
    gh.factory<_i10.LocationBloc>(() => _i10.LocationBloc(
          locationRepository: gh<_i11.LocationRepository>(),
          spot: gh<_i12.MapModel>(),
        ));
    gh.factory<_i13.LoginBloc>(() => _i13.LoginBloc());
    gh.factory<_i14.MapProvider>(() => _i14.MapProvider());
    gh.factory<_i15.NavigationCubit>(() => _i15.NavigationCubit());
    gh.singleton<_i16.Prefs>(_i16.Prefs());
    gh.factory<_i17.SpotBloc>(() => _i17.SpotBloc(spot: gh<_i12.MapModel>()));
    return this;
  }
}
