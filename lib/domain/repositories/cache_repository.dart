abstract class CacheRepository {
  void saveAccessToken(String token);
  Future<String?> getAccessToken();
  void saveUserCode(String code);
  Future<String?> getUserCode();
}
