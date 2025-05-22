import 'package:dio/dio.dart';
import 'package:sw_flutter_carlos/core/config/dio_client.dart';
import 'package:sw_flutter_carlos/features/orders/model/order_model.dart';

class OrdersApi {
  final String _baseUrl = 'https://dev-techtest.swfast.com.br';
  final Dio _dio = DioClient.client;

  Future<List<OrderModel>> getOrders({bool includeFinished = true}) async {
    final url = '$_baseUrl/orders?includeFinished=$includeFinished';
    try {
      final response = await _dio.get(
        url,
        options: Options(headers: {'Content-Type': 'application/json'}),
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
    final url = '$_baseUrl/orders';
    try {
      final response = await _dio.post(
        url,
        options: Options(headers: {'Content-Type': 'application/json'}),
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
    final url = '$_baseUrl/orders/$orderId/finish';
    try {
      final response = await _dio.put(
        url,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode != 200) {
        throw Exception('Erro ao finalizar pedido: \\${response.data}');
      }
    } catch (e) {
      throw Exception('Erro ao finalizar pedido: $e');
    }
  }
}
