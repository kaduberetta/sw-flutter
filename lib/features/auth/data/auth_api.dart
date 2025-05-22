import 'package:dio/dio.dart';
import 'package:sw_flutter_carlos/core/config/dio_client.dart';
import '../model/token_model.dart';

class AuthApi {
  final _baseUrl = 'https://dev-techtest.swfast.com.br';
  final _clientId = 'user';
  final Dio _dio = DioClient.client;

  Future<TokenModel?> login(String username, String password) async {
    final url = '$_baseUrl/connect/token';
    try {
      final response = await _dio.post(
        url,
        options: Options(headers: {'Content-Type': 'application/x-www-form-urlencoded'}),
        data: {
          'grant_type': 'password',
          'client_id': _clientId,
          'username': username,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return TokenModel.fromJson(response.data);
      } else {
        print('Erro ao fazer login: \\${response.data}');
        return null;
      }
    } catch (e) {
      print('Erro ao fazer login: $e');
      return null;
    }
  }

  Future<TokenModel?> refreshToken(String refreshToken) async {
    final url = '$_baseUrl/connect/token';
    try {
      final response = await _dio.post(
        url,
        options: Options(headers: {'Content-Type': 'application/x-www-form-urlencoded'}),
        data: {
          'grant_type': 'refresh_token',
          'client_id': _clientId,
          'refresh_token': refreshToken,
        },
      );
      if (response.statusCode == 200) {
        return TokenModel.fromJson(response.data);
      } else {
        print('Erro ao renovar token: \\${response.data}');
        return null;
      }
    } catch (e) {
      print('Erro ao renovar token: $e');
      return null;
    }
  }

  Future<bool> revokeToken(String token) async {
    final url = '$_baseUrl/connect/revocation';
    try {
      final response = await _dio.post(
        url,
        options: Options(headers: {'Content-Type': 'application/x-www-form-urlencoded'}),
        data: {'client_id': _clientId, 'token': token, 'token_type_hint': 'refresh_token'},
      );
      return response.statusCode == 200;
    } catch (e) {
      print('Erro ao revogar token: $e');
      return false;
    }
  }
}
