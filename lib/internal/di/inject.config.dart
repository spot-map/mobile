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
import 'package:location_repository/location_repository.dart' as _i9;
import 'package:ride_map/data/map_page_models/map_model.dart' as _i10;
import 'package:ride_map/domain/api/provider/login_provider.dart' as _i3;
import 'package:ride_map/domain/api/provider/map_provider.dart' as _i12;
import 'package:ride_map/domain/api/repository/i_auth_repository.dart' as _i4;
import 'package:ride_map/domain/api/repository/i_map_repository.dart' as _i6;
import 'package:ride_map/domain/api/service/login_service.dart' as _i5;
import 'package:ride_map/domain/api/service/map_service.dart' as _i7;
import 'package:ride_map/domain/bloc/location/location_bloc.dart' as _i8;
import 'package:ride_map/domain/bloc/login/login_bloc.dart' as _i11;
import 'package:ride_map/domain/bloc/navigation/navigation_cubit.dart' as _i13;
import 'package:ride_map/domain/bloc/spot/spot_bloc.dart' as _i15;
import 'package:ride_map/untils/preferences/preferences.dart' as _i14;

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
    gh.factory<_i4.IAuthRepository>(() => _i5.AuthService());
    gh.factory<_i6.IMapRepository>(() => _i7.MapService());
    gh.factory<_i8.LocationBloc>(() => _i8.LocationBloc(
          locationRepository: gh<_i9.LocationRepository>(),
          spot: gh<_i10.MapModel>(),
        ));
    gh.factory<_i11.LoginBloc>(() => _i11.LoginBloc());
    gh.factory<_i12.MapProvider>(() => _i12.MapProvider());
    gh.factory<_i13.NavigationCubit>(() => _i13.NavigationCubit());
    gh.singleton<_i14.Prefs>(_i14.Prefs());
    gh.factory<_i15.SpotBloc>(() => _i15.SpotBloc(spot: gh<_i10.MapModel>()));
    return this;
  }
}
