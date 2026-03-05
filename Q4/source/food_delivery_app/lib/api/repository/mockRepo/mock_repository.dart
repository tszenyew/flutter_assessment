import '../../data/mockData/mock_data.dart';
import '../../../screens/checkout/models/cart_item_model.dart';
import '../../../screens/food_menu/models/menu_item_model.dart';
import '../../../screens/order_tracking/models/order_model.dart';
import '../../../screens/restaurant_list/models/restaurant_model.dart';

class MockRepository {
  Future<List<RestaurantModel>> getRestaurants() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return MockData.restaurants;
  }

  Future<List<MenuItemModel>> getMenuByRestaurant(String restaurantId) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return MockData.menuItems.where((MenuItemModel item) => item.restaurantId == restaurantId).toList();
  }

  Future<OrderModel> createOrder({required List<CartItemModel> items}) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));

    final double subtotal = items.fold(0, (double sum, CartItemModel item) => sum + item.totalPrice);
    final double deliveryFee = items.isEmpty ? 0 : 3.99;

    return OrderModel(id: 'ORD-${DateTime.now().millisecondsSinceEpoch}', items: items, subtotal: subtotal, deliveryFee: deliveryFee, total: subtotal + deliveryFee, status: OrderStatus.preparing, createdAt: DateTime.now());
  }
}
