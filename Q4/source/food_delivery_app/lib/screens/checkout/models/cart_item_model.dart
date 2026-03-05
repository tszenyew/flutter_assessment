import '../../food_menu/models/menu_item_model.dart';

class CartItemModel {
  CartItemModel({required this.menuItem, this.quantity = 1});

  final MenuItemModel menuItem;
  int quantity;

  double get totalPrice => menuItem.price * quantity;
}
