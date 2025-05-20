// lib/features/auth/data/auth_api.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/token_model.dart';

class AuthApi {
  final _baseUrl = 'https://dev-techtest.swfast.com.br';
  final _clientId = 'user';
  // final _clientSecret = 'YOUR_CLIENT_SECRET';

  Future<TokenModel?> login(String username, String password) async {
    final url = Uri.parse('$_baseUrl/connect/token');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'grant_type': 'password',
        'username': username,
        'password': password,
        'client_id': _clientId,
        // 'client_secret': _clientSecret,
        // 'scope': 'read write',
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return TokenModel.fromJson(json);
    } else {
      print('Erro ao fazer login: ${response.body}');
      return null;
    }
  }

  Future<TokenModel?> refreshToken(String refreshToken) async {
    final url = Uri.parse('$_baseUrl/connect/token');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'grant_type': 'refresh_token',
        'refresh_token': refreshToken,
        'client_id': _clientId,
        // 'client_secret': _clientSecret,
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return TokenModel.fromJson(json);
    } else {
      print('Erro ao renovar token: ${response.body}');
      return null;
    }
  }
}
