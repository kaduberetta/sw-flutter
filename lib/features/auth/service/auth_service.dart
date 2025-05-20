import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sw_flutter_carlos/features/auth/data/auth_api.dart';
import 'package:sw_flutter_carlos/features/auth/model/token_model.dart';

class AuthService {
  final AuthApi _api = AuthApi();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<bool> login(String username, String password) async {
    final token = await _api.login(username, password);
    if (token != null) {
      await _saveToken(token);
      return true;
    }
    return false;
  }

  Future<bool> refreshAccessToken() async {
    final refreshToken = await _storage.read(key: 'refresh_token');
    if (refreshToken == null) return false;

    final newToken = await _api.refreshToken(refreshToken);
    if (newToken != null) {
      await _saveToken(newToken);
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    await _storage.deleteAll();
  }

  Future<void> _saveToken(TokenModel token) async {
    await _storage.write(key: 'access_token', value: token.accessToken);
    await _storage.write(key: 'refresh_token', value: token.refreshToken);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: 'access_token');
  }
}
