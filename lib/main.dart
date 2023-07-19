import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/untils/bloc/bloc_observable.dart';
import 'package:ride_map/untils/preferences/preferences.dart';
import 'internal/app.dart';
import 'internal/di/inject.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await init();
  BlocOverrides.runZoned(() => {runApp(const App())}, blocObserver: AppBlocObservable());
}

Future<void> init() async {
  await Prefs.init();

}
