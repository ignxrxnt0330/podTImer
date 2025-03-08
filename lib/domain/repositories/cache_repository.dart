import 'package:shared_preferences/shared_preferences.dart';

class CacheRepository {
  late SharedPreferences prefs;
  void saveAccessToken(String token) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString("accessToken", token);
    prefs.setInt("accessTokenExpiration", DateTime.now().millisecondsSinceEpoch);
  }

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
}
