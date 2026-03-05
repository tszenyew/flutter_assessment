import '../../checkout/models/cart_item_model.dart';

enum OrderStatus { preparing, onTheWay, delivered }

class OrderModel {
  const OrderModel({required this.id, required this.items, required this.subtotal, required this.deliveryFee, required this.total, required this.status, required this.createdAt});

  final String id;
  final List<CartItemModel> items;
  final double subtotal;
  final double deliveryFee;
  final double total;
  final OrderStatus status;
  final DateTime createdAt;

  OrderModel copyWith({OrderStatus? status}) {
    return OrderModel(id: id, items: items, subtotal: subtotal, deliveryFee: deliveryFee, total: total, status: status ?? this.status, createdAt: createdAt);
  }
}
