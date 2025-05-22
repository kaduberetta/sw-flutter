import 'package:flutter/material.dart';
import 'package:sw_flutter_carlos/features/orders/service/orders_service.dart';
import 'package:sw_flutter_carlos/core/config/status_notifier.dart';
import 'package:sw_flutter_carlos/features/orders/viewmodel/list_orders_provider.dart';
import 'package:sw_flutter_carlos/service_locator.dart';

class OrderDetailsProvider extends ChangeNotifier with StatusNotifier {
  final OrdersService _ordersService;
  OrderDetailsProvider(this._ordersService);

  Future<void> finishOrder(String orderId) async {
    setLoading();
    try {
      await _ordersService.finishOrder(orderId);
      setSuccess();
      sl<ListOrdersProvider>().fetchOrders();
    } catch (e) {
      setError('Erro ao finalizar pedido: ${e.toString()}');
    }
  }
}
