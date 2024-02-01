import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ride_map/until/bloc/bloc_observable.dart';
import 'package:ride_map/until/preferences/preferences.dart';
import 'firebase_options.dart';
import 'internal/app.dart';
import 'internal/di/inject.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerGetIt();
  initDefault();
  initCrashlytics();
  initObserver();
  Geolocator.requestPermission();

  if(Geolocator.checkPermission() == LocationPermission.denied){
  }

  runApp(const App());
}

void initObserver(){
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



Future<void> initDefault() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
