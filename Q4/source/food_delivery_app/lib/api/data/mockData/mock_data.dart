import '../../../screens/food_menu/models/menu_item_model.dart';
import '../../../screens/restaurant_list/models/restaurant_model.dart';

class MockData {
  static final List<RestaurantModel> restaurants = <RestaurantModel>[
    const RestaurantModel(id: 'r1', name: 'Sunset Bites', rating: 4.7, cuisineType: 'American', imageUrl: 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&w=1200&q=80'),
    const RestaurantModel(id: 'r2', name: 'Spice Route', rating: 4.5, cuisineType: 'Indian', imageUrl: 'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?auto=format&fit=crop&w=1200&q=80'),
    const RestaurantModel(id: 'r3', name: 'Tokyo Table', rating: 4.8, cuisineType: 'Japanese', imageUrl: 'https://images.unsplash.com/photo-1559339352-11d035aa65de?auto=format&fit=crop&w=1200&q=80'),
    const RestaurantModel(id: 'r4', name: 'Bella Napoli', rating: 4.6, cuisineType: 'Italian', imageUrl: 'https://images.unsplash.com/photo-1528605248644-14dd04022da1?auto=format&fit=crop&w=1200&q=80'),
    const RestaurantModel(id: 'r5', name: 'Green Fork', rating: 4.4, cuisineType: 'Healthy', imageUrl: 'https://images.unsplash.com/photo-1466978913421-dad2ebd01d17?auto=format&fit=crop&w=1200&q=80'),
  ];

  static final List<MenuItemModel> menuItems = <MenuItemModel>[
    const MenuItemModel(id: 'm1', restaurantId: 'r1', name: 'Classic Cheeseburger', price: 8.99, imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=500&q=80'),
    const MenuItemModel(id: 'm2', restaurantId: 'r1', name: 'Crispy Fries', price: 3.99, imageUrl: 'https://images.unsplash.com/photo-1576107232684-1279f390859f?auto=format&fit=crop&w=500&q=80'),
    const MenuItemModel(id: 'm3', restaurantId: 'r1', name: 'Chicken Wrap', price: 7.49, imageUrl: 'https://images.unsplash.com/photo-1529006557810-274b9b2fc783?auto=format&fit=crop&w=500&q=80'),
    const MenuItemModel(id: 'm4', restaurantId: 'r2', name: 'Butter Chicken', price: 10.99, imageUrl: 'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?auto=format&fit=crop&w=500&q=80'),
    const MenuItemModel(id: 'm5', restaurantId: 'r2', name: 'Garlic Naan', price: 2.99, imageUrl: 'https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=500&q=80'),
    const MenuItemModel(id: 'm6', restaurantId: 'r2', name: 'Paneer Tikka', price: 9.49, imageUrl: 'https://images.unsplash.com/photo-1631452180519-c014fe946bc7?auto=format&fit=crop&w=500&q=80'),
    const MenuItemModel(id: 'm7', restaurantId: 'r3', name: 'Salmon Sushi Roll', price: 11.50, imageUrl: 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?auto=format&fit=crop&w=500&q=80'),
    const MenuItemModel(id: 'm8', restaurantId: 'r3', name: 'Chicken Katsu', price: 12.20, imageUrl: 'https://images.unsplash.com/photo-1617196039897-7b2f83933b79?auto=format&fit=crop&w=500&q=80'),
    const MenuItemModel(id: 'm9', restaurantId: 'r3', name: 'Miso Soup', price: 4.20, imageUrl: 'https://images.unsplash.com/photo-1547592166-23ac45744acd?auto=format&fit=crop&w=500&q=80'),
    const MenuItemModel(id: 'm10', restaurantId: 'r4', name: 'Margherita Pizza', price: 13.00, imageUrl: 'https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=500&q=80'),
    const MenuItemModel(id: 'm11', restaurantId: 'r4', name: 'Pasta Alfredo', price: 11.30, imageUrl: 'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?auto=format&fit=crop&w=500&q=80'),
    const MenuItemModel(id: 'm12', restaurantId: 'r4', name: 'Tiramisu', price: 5.50, imageUrl: 'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?auto=format&fit=crop&w=500&q=80'),
    const MenuItemModel(id: 'm13', restaurantId: 'r5', name: 'Avocado Bowl', price: 9.80, imageUrl: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=500&q=80'),
    const MenuItemModel(id: 'm14', restaurantId: 'r5', name: 'Protein Salad', price: 10.40, imageUrl: 'https://images.unsplash.com/photo-1511690743698-d9d85f2fbf38?auto=format&fit=crop&w=500&q=80'),
    const MenuItemModel(id: 'm15', restaurantId: 'r5', name: 'Fresh Smoothie', price: 4.90, imageUrl: 'https://images.unsplash.com/photo-1502741338009-cac2772e18bc?auto=format&fit=crop&w=500&q=80'),
  ];
}
