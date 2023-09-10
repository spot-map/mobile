import 'package:firebase_core/firebase_core.dart';
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
  await init();
  initializeDefault();
  Bloc.observer = AppBlocObservable();
  runApp(const App());
}

Future<void> init() async {
  await Prefs.init();
  if (Prefs.getBool('theme') == null) {
    Prefs.setBool('theme', false);
  }
}

Future<void> initializeDefault() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final fcm = await FirebaseMessaging.instance.getToken();
  Prefs.setString('fcm', fcm!);
  Dev.log('FCM $fcm', name: 'FIREBASE TOKEN');
}
