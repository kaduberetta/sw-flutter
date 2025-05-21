class OrderModel {
  final String id;
  final String customerName;
  final String description;
  final DateTime createdAt;
  final bool finished;

  OrderModel({
    required this.id,
    required this.customerName,
    required this.description,
    required this.createdAt,
    required this.finished,
  });
}
