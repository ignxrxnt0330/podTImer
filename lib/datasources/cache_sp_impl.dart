import 'package:podtimer/domain/repositories/cache_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheSpImpl extends CacheRepository {
  late SharedPreferences prefs;

  @override
  void saveAccessToken(String token) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString("accessToken", token);
    prefs.setInt("accessTokenExpiration", DateTime.now().millisecondsSinceEpoch);
  }

  @override
  Future<String?> getAccessToken() async {
    prefs = await SharedPreferences.getInstance();
    int? expiration = prefs.getInt("accessTokenExpiration");
    if (expiration != null) {
      DateTime expirationDate = DateTime.fromMillisecondsSinceEpoch(expiration);
      bool expired = !expirationDate.add(const Duration(hours: 1)).isAfter(DateTime.now());
      if (expired) {
        return null;
      }
    }

    final token = prefs.getString("accessToken");
    return token;
  }

  @override
  void saveUserCode(String code) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString("userCode", code);
  }

  @override
  Future<String?> getUserCode() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString("userCode");
  }
}
