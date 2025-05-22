import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sw_flutter_carlos/core/config/auth_manager.dart';
import 'package:sw_flutter_carlos/features/auth/service/auth_service.dart';
import 'package:sw_flutter_carlos/service_locator.dart';

class DioClient {
  static final Dio _dio = Dio(BaseOptions(baseUrl: 'https://dev-techtest.swfast.com.br'));

  static final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static final _authService = sl<AuthService>();

  static Dio get client {
    _dio.interceptors.clear();

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _storage.read(key: 'access_token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },

        onError: (DioException e, ErrorInterceptorHandler handler) async {
          if (e.response?.statusCode == 401) {
            // Try refresh token
            final refreshed = await _authService.refreshAccessToken();
            if (refreshed) {
              final token = await _storage.read(key: 'access_token');
              final opts = e.requestOptions;
              opts.headers['Authorization'] = 'Bearer $token';
              try {
                final cloneReq = await _dio.fetch(opts);
                return handler.resolve(cloneReq);
              } catch (err) {
                return handler.reject(e);
              }
            } else {
              // Refresh token failed: user needs to log in again
              await _authService.logout();
              AuthManager.onLogout?.call();
              return handler.reject(e);
            }
          }
          return handler.next(e);
        },
      ),
    );

    return _dio;
  }
}
