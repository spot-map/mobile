// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:ride_map/data/spot_model/spot_model.dart' as _i11;
import 'package:ride_map/domain/api/repository/i_auth_repository.dart' as _i3;
import 'package:ride_map/domain/api/repository/i_map_repository.dart' as _i5;
import 'package:ride_map/domain/api/repository/i_registration_repository.dart'
    as _i7;
import 'package:ride_map/domain/api/service/auth_service.dart' as _i4;
import 'package:ride_map/domain/api/service/map_service.dart' as _i6;
import 'package:ride_map/domain/api/service/registration_service.dart' as _i8;
import 'package:ride_map/domain/bloc/spot/spot_bloc.dart' as _i10;
import 'package:ride_map/untils/preferences/preferences.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
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
    gh.factory<_i9.Preferences>(() => _i9.Preferences());
    gh.factory<_i10.SpotBloc>(() => _i10.SpotBloc(gh<_i11.SpotModel>()));
    return this;
  }
}
