import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ride_map/data/clients/firebase_options.dart';
import 'package:ride_map/domain/data/storage/theme/theme.dart';
import 'package:ride_map/domain/data/storage/token/token.dart';

Future initAsyncService() async {
  await Future.wait([
    Hive.initFlutter(),
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    )
  ]);

  await Future.wait([TokenStorageUseCaseImpl.initHive(), ThemeStorageUseCaseImpl.initHive()]);
}
