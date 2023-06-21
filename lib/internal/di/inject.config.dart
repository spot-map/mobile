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
import 'package:ride_map/domain/api/provider/map_provider.dart' as _i12;
import 'package:ride_map/domain/api/repository/i_auth_repository.dart' as _i3;
import 'package:ride_map/domain/api/repository/i_map_repository.dart' as _i5;
import 'package:ride_map/domain/api/repository/i_registration_repository.dart'
    as _i7;
import 'package:ride_map/domain/api/service/auth_service.dart' as _i4;
import 'package:ride_map/domain/api/service/map_service.dart' as _i6;
import 'package:ride_map/domain/api/service/registration_service.dart' as _i8;
import 'package:ride_map/domain/bloc/location/bloc/location_bloc.dart' as _i9;
import 'package:ride_map/untils/preferences/preferences.dart' as _i13;

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
    gh.factory<_i3.IAuthRepository>(() => _i4.Auth());
    gh.factory<_i5.IMapRepository>(() => _i6.MapService());
    gh.factory<_i7.IRegistrationRepository>(() => _i8.Registration());
    gh.factory<_i9.LocationBloc>(() => _i9.LocationBloc(
          locationRepository: gh<_i10.LocationRepository>(),
          spot: gh<_i11.MapModel>(),
        ));
    gh.factory<_i12.MapProvider>(() => _i12.MapProvider());
    gh.factory<_i13.Preferences>(() => _i13.Preferences());
    return this;
  }
}
