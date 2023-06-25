import 'package:flutter/material.dart';
import 'package:ride_map/untils/preferences/preferences.dart';
import 'internal/app.dart';
import 'internal/di/inject.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await init();
  runApp(const App());
}

Future<void> init() async {
  await Prefs.init();
}
