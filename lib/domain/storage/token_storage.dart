import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class TokenStorage {
  void saveToken(String key, String value);

  Future<String> readToken(String key);

  void deleteToken(String key);
}

class TokenStorageImpl implements TokenStorage {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock));

  @override
  void saveToken(String key, String value) {
    _secureStorage.write(key: key, value: value);
  }

  @override
  Future<String> readToken(String key) async {
    String value = await _secureStorage.read(key: key) ?? 'No data found!';
    return value;
  }

  @override
  void deleteToken(String key) {
    _secureStorage.delete(key: key);
  }
}
