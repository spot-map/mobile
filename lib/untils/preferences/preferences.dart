import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  String selectedThemeValue = 'selected Value';
  String authToken = 'Token is ';

  static Preferences? _instance;

  factory Preferences() => _instance ??= Preferences._();

  Preferences._();

  SharedPreferences? sharedPrefs;

  Future<void> init() async {
    sharedPrefs = await SharedPreferences.getInstance();
  }

  bool? get value => sharedPrefs?.getBool(selectedThemeValue);

  set themeBool(bool value) {
    sharedPrefs?.setBool(selectedThemeValue, value);
  }

  String? get getToken => sharedPrefs?.getString(authToken);

  set tokenString(String value) {
    sharedPrefs?.setString(authToken, value);
  }


  Future<bool>? get deleteToken => sharedPrefs?.remove(authToken);
}
