import 'package:ride_map/domain/storage/token_storage.dart';
import 'package:ride_map/internal/di/inject.dart';

abstract class TokenStorageUseCase {
  void saveToken(String key, String value);

  Future<String> readToken(String key);

  void deleteToken(String key);
}

class TokenStorageUseCaseImpl implements TokenStorageUseCase {
  final TokenStorage _storage = getIt();

  @override
  void saveToken(String key, String value) => _storage.saveToken(key, value);

  @override
  Future<String> readToken(String key) => _storage.readToken(key);

  @override
  void deleteToken(String key) => _storage.deleteToken(key);
}
