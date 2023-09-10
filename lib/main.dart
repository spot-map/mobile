import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/until/bloc/bloc_observable.dart';
import 'package:ride_map/until/dev.dart';
import 'package:ride_map/until/preferences/preferences.dart';
import 'firebase_options.dart';
import 'internal/app.dart';
import 'internal/di/inject.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await initPreferences();
  initDefault();
  initCrashlytics();
  initObserver();
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

Future<void> initPreferences() async {
  await Prefs.init();
  if (Prefs.getBool('theme') == null) {
    Prefs.setBool('theme', false);
  }
}

Future<void> initDefault() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final fcm = await FirebaseMessaging.instance.getToken();
  Prefs.setString('fcm', fcm!);
  Dev.log('FCM $fcm', name: 'FIREBASE TOKEN');
}
