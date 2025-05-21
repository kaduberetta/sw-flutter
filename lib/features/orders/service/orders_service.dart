import 'package:sw_flutter_carlos/features/orders/model/order_model.dart';

import '../data/orders_api.dart';

class OrdersService {
  final OrdersApi _api = OrdersApi();
  Future<List<OrderModel>> getOrders({bool includeFinished = true}) async {
    return await _api.getOrders(includeFinished: includeFinished);
  }

  Future<OrderModel> createOrder({
    required String customerName,
    required String description,
  }) async {
    return await _api.createOrder(customerName: customerName, description: description);
  }

  Future<void> finishOrder(String orderId) async {
    await _api.finishOrder(orderId);
  }
}
