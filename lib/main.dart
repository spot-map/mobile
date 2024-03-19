import 'dart:ui';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ride_map/core/app.dart';
import 'package:ride_map/core/di/inject.dart';
import 'package:ride_map/core/init_async_service.dart';
import 'package:ride_map/core/bloc_observable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerGetIt();
  await initAsyncService();
  initCrashlytics();
  initObserver();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  Geolocator.requestPermission();

  if (Geolocator.checkPermission() == LocationPermission.denied) return;

  runApp(const App());
}

void initObserver() {
  Bloc.observer = AppBlocObservable();
}

void initCrashlytics() {
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}
