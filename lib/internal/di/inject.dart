import 'package:get_it/get_it.dart';
import 'package:ride_map/untils/bloc/bloc_inital.dart';
import 'package:ride_map/untils/dio/dio_manager.dart';
import 'package:ride_map/untils/preferences/preferences.dart';

GetIt injector = GetIt.instance;

void initializeDependency() {
  injector.registerFactory(() => DioManager());
  injector.registerFactory(() => BlocInitial.bloc);
  injector.registerFactory(() => Preferences());
}

