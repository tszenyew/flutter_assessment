import 'package:get/get.dart';

import '../../api/repository/mockRepo/mock_repository.dart';
import '../food_menu/models/menu_item_model.dart';
import '../order_tracking/models/order_model.dart';
import 'models/cart_item_model.dart';

class CheckoutVm extends GetxController {
  CheckoutVm(this._repository);

  final MockRepository _repository;

  final RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  double get subtotal => cartItems.fold(0, (double sum, CartItemModel item) => sum + item.totalPrice);

  double get deliveryFee => cartItems.isEmpty ? 0 : 3.99;

  double get total => subtotal + deliveryFee;

  int get totalItems => cartItems.fold(0, (int sum, CartItemModel item) => sum + item.quantity);

  void addItem(MenuItemModel menuItem) {
    final int existingIndex = cartItems.indexWhere((CartItemModel item) => item.menuItem.id == menuItem.id);

    if (existingIndex >= 0) {
      cartItems[existingIndex].quantity += 1;
      cartItems.refresh();
      return;
    }

    cartItems.add(CartItemModel(menuItem: menuItem));
  }

  void increaseQuantity(CartItemModel item) {
    item.quantity += 1;
    cartItems.refresh();
  }

  void decreaseQuantity(CartItemModel item) {
    if (item.quantity == 1) {
      cartItems.remove(item);
      return;
    }

    item.quantity -= 1;
    cartItems.refresh();
  }

  Future<OrderModel> placeOrder() async {
    final List<CartItemModel> snapshot = cartItems.map((CartItemModel item) => CartItemModel(menuItem: item.menuItem, quantity: item.quantity)).toList();

    final OrderModel order = await _repository.createOrder(items: snapshot);
    cartItems.clear();
    return order;
  }
}
