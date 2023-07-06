import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
@injectable
class Prefs {
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  static Future<bool> setInt(String key, int value) async =>
      await _prefs!.setInt(key, value);

  static Future<bool> setString(String key, String value) async =>
      await _prefs!.setString(key, value);

  static Future<bool> setBool(String key, bool value) async =>
      await _prefs!.setBool(key, value);

  static int? getInt(String key) => _prefs!.getInt(key);

  static String? getString(String key) => _prefs!.getString(key);

  static bool? getBool(String key) => _prefs!.getBool(key);

  static Future<bool> remove(String key) async => await _prefs!.remove(key);

  static Future<bool> clear() async => await _prefs!.clear();
}
