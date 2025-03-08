import 'package:dio/dio.dart';
import 'package:podtimer/config/constants/environment.dart';
import 'package:podtimer/domain/repositories/cache_repository.dart';

class Datasource {
  final dio = Dio(BaseOptions(baseUrl: 'https://api.spotify.com/v1/'));

  Future<String> getAccessToken() async {
    String? token = await CacheRepository().getAccessToken();
    if (token != null) {
      return token;
    }
    return await generateAccessToken();
  }

  Future<String> generateAccessToken() async {
    final res = await Dio(BaseOptions(
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
    )).post(
      "https://accounts.spotify.com/api/token",
      queryParameters: {"client_id": Environment.clientId, "client_secret": Environment.clienSecret, "grant_type": "client_credentials"},
    );
    CacheRepository().saveAccessToken(res.data["access_token"]);
    return res.data["access_token"];
  }

  Dio getDio() {
    return dio.clone(options: BaseOptions(headers: {"Authorization": "Bearer ${getAccessToken()}"}));
  }
}
