import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sw_flutter_carlos/features/orders/model/order_model.dart';
import 'package:sw_flutter_carlos/features/auth/service/auth_service.dart';
import 'package:sw_flutter_carlos/core/config/auth_manager.dart';

class OrdersApi {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final String _baseUrl = 'https://dev-techtest.swfast.com.br';
  final Dio _dio = Dio();
  final AuthService _authService = AuthService();

  Future<String?> _getToken() async {
    return await _storage.read(key: 'access_token');
  }

  OrdersApi() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, ErrorInterceptorHandler handler) async {
          if (e.response?.statusCode == 401) {
            // Tenta refresh token
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
  }

  Future<List<OrderModel>> getOrders({bool includeFinished = true}) async {
    final token = await _getToken();
    final url = '$_baseUrl/orders?includeFinished=$includeFinished';
    try {
      final response = await _dio.get(
        url,
        options: Options(
          headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'},
        ),
      );
      if (response.statusCode == 200) {
        final List data = response.data;
        return data
            .map(
              (e) => OrderModel(
                id: e['id'],
                customerName: e['customerName'],
                description: e['description'],
                createdAt: DateTime.parse(e['createdAt']),
                finished: e['finished'],
              ),
            )
            .toList()
            .cast<OrderModel>();
      } else {
        throw Exception('Erro ao buscar pedidos: \\${response.data}');
      }
    } catch (e) {
      throw Exception('Erro ao buscar pedidos: $e');
    }
  }

  Future<OrderModel> createOrder({
    required String customerName,
    required String description,
  }) async {
    final token = await _getToken();
    final url = '$_baseUrl/orders';
    try {
      final response = await _dio.post(
        url,
        options: Options(
          headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'},
        ),
        data: {'customerName': customerName, 'description': description},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        return OrderModel(
          id: data['id'],
          customerName: data['customerName'],
          description: data['description'],
          createdAt: DateTime.parse(data['createdAt']),
          finished: data['finished'],
        );
      } else {
        throw Exception('Erro ao criar pedido: \\${response.data}');
      }
    } catch (e) {
      throw Exception('Erro ao criar pedido: $e');
    }
  }

  Future<void> finishOrder(String orderId) async {
    final token = await _getToken();
    final url = '$_baseUrl/orders/$orderId/finish';
    try {
      final response = await _dio.put(
        url,
        options: Options(
          headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'},
        ),
      );
      if (response.statusCode != 200) {
        throw Exception('Erro ao finalizar pedido: \\${response.data}');
      }
    } catch (e) {
      throw Exception('Erro ao finalizar pedido: $e');
    }
  }
}
