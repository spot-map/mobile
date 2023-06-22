import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ride_map/internal/di/inject.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void setup() => getIt.init();
