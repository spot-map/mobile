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
import 'package:location_repository/location_repository.dart' as _i10;
import 'package:ride_map/data/map_page_models/map_model.dart' as _i11;
import 'package:ride_map/domain/api/provider/login_provider.dart' as _i13;
import 'package:ride_map/domain/api/provider/map_provider.dart' as _i14;
import 'package:ride_map/domain/api/provider/registration_provider.dart'
    as _i18;
import 'package:ride_map/domain/api/repository/i_auth_repository.dart' as _i3;
import 'package:ride_map/domain/api/repository/i_map_repository.dart' as _i5;
import 'package:ride_map/domain/api/repository/i_registration_repository.dart'
    as _i7;
import 'package:ride_map/domain/api/service/login_service.dart' as _i4;
import 'package:ride_map/domain/api/service/map_service.dart' as _i6;
import 'package:ride_map/domain/api/service/registration_service.dart' as _i8;
import 'package:ride_map/domain/bloc/location/location_bloc.dart' as _i9;
import 'package:ride_map/domain/bloc/login/login_bloc.dart' as _i12;
import 'package:ride_map/domain/bloc/navigation/navigation_cubit.dart' as _i15;
import 'package:ride_map/domain/bloc/registration/registration_bloc.dart'
    as _i17;
import 'package:ride_map/domain/bloc/spot/spot_bloc.dart' as _i19;
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
    gh.factory<_i3.IAuthRepository>(() => _i4.LoginService());
    gh.factory<_i5.IMapRepository>(() => _i6.MapService());
    gh.factory<_i7.IRegistrationRepository>(() => _i8.RegistrationService());
    gh.factory<_i9.LocationBloc>(() => _i9.LocationBloc(
          locationRepository: gh<_i10.LocationRepository>(),
          spot: gh<_i11.MapModel>(),
        ));
    gh.factory<_i12.LoginBloc>(() => _i12.LoginBloc());
    gh.factory<_i13.LoginProvider>(() => _i13.LoginProvider());
    gh.factory<_i14.MapProvider>(() => _i14.MapProvider());
    gh.factory<_i15.NavigationCubit>(() => _i15.NavigationCubit());
    gh.factory<_i16.Preferences>(() => _i16.Preferences());
    gh.factory<_i17.RegistrationBloc>(() => _i17.RegistrationBloc());
    gh.factory<_i18.RegistrationProvider>(() => _i18.RegistrationProvider());
    gh.factory<_i19.SpotBloc>(() => _i19.SpotBloc(spot: gh<_i11.MapModel>()));
    return this;
  }
}
