import 'package:hive/hive.dart';
import 'package:ride_map/data/storage/token.dart';

class TokenStorageUseCaseImpl implements TokenStorage {
  static const String _boxName = 'TokensStorage';
  static const String _key = 'token';

  static Future initHive() async {
    return Hive.openBox<String?>(_boxName);
  }

  final _hiveBox = Hive.box<String?>(_boxName);

  @override
  String? get accessToken => _hiveBox.get(_key);

  @override
  set accessToken(String? value) => _hiveBox.put(_key, value);

  @override
  Future<void> deleteTokens() async {
    await _hiveBox.deleteAll([_key]);
  }
}
