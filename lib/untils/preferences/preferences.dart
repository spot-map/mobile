import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
@singleton
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

  // set setToken(String value) {
  //   sharedPrefs?.setString(authToken, value);
  // }

  Future<bool>? get deleteToken => sharedPrefs?.remove(authToken);

  void setToken(String value) {
    sharedPrefs?.setString(authToken, value);
  }
}
