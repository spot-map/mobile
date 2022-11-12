import 'package:flutter/material.dart';
import 'package:ride_map/untils/bloc/bloc_observable.dart';
import 'package:ride_map/untils/preferences/preferences.dart';
import 'internal/app.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'internal/di/inject.dart';

void main() async {
  await dotenv.load(fileName: "assets/.env");
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory());

  HydratedBlocOverrides.runZoned(() => runApp(const App()),
      blocObserver: AppBlocObservable(), storage: storage);
  initializeDependency();
  await init();
}

Future<void> init() async {
  await Preferences().init();
}