import 'package:flutter/material.dart';
import 'package:sw_flutter_carlos/features/orders/model/order_model.dart';
import 'package:sw_flutter_carlos/features/orders/service/orders_service.dart';
import 'package:sw_flutter_carlos/core/config/status_notifier.dart';
import 'package:sw_flutter_carlos/features/orders/viewmodel/list_orders_provider.dart';
import 'package:sw_flutter_carlos/service_locator.dart';

class CreateOrderProvider extends ChangeNotifier with StatusNotifier {
  final OrdersService _ordersService = OrdersService();

  String _customerName = '';
  String _description = '';

  String get customerName => _customerName;
  String get description => _description;

  void setCustomerName(String value) {
    _customerName = value;
    notifyListeners();
  }

  void setDescription(String value) {
    _description = value;
    notifyListeners();
  }

  Future<OrderModel?> createOrder() async {
    setLoading();
    try {
      final order = await _ordersService.createOrder(
        customerName: _customerName,
        description: _description,
      );
      setSuccess();
      sl<ListOrdersProvider>().fetchOrders();
      return order;
    } catch (e) {
      setError('Erro ao criar pedido: ${e.toString()}');
      return null;
    }
  }
}
