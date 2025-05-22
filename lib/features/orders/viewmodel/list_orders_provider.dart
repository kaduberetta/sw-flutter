import 'package:flutter/material.dart';
import 'package:sw_flutter_carlos/features/orders/model/order_model.dart';
import 'package:sw_flutter_carlos/features/orders/service/orders_service.dart';
import 'package:sw_flutter_carlos/core/config/status_notifier.dart';

class ListOrdersProvider extends ChangeNotifier with StatusNotifier {
  ListOrdersProvider(this._ordersService) {
    fetchOrders();
  }

  final OrdersService _ordersService;
  List<OrderModel> _orders = [];
  List<OrderModel> get orders => _orders;
  List<OrderModel> get pendingOrders => _orders.where((o) => !o.finished).toList();
  List<OrderModel> get finishedOrders => _orders.where((o) => o.finished).toList();

  Future<void> fetchOrders() async {
    setLoading();
    try {
      _orders = await _ordersService.getOrders();
      setSuccess();
    } catch (e) {
      setError('Erro ao buscar pedidos: \\${e.toString()}');
    }
  }
}
