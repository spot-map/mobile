abstract class TokenStorage {
  late final String? accessToken;

  Future<void> deleteTokens();
}
