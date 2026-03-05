import 'package:get/get.dart';

import '../api/repository/mockRepo/mock_repository.dart';
import '../screens/checkout/checkout_screen.dart';
import '../screens/checkout/checkout_vm.dart';
import '../screens/food_menu/food_menu_screen.dart';
import '../screens/food_menu/food_menu_vm.dart';
import '../screens/order_tracking/order_tracking_screen.dart';
import '../screens/order_tracking/order_tracking_vm.dart';
import '../screens/restaurant_list/restaurant_list_screen.dart';
import '../screens/restaurant_list/restaurant_list_vm.dart';

class ScreenRoute {
  static const String restaurantList = '/';
  static const String foodMenu = '/food-menu';
  static const String checkout = '/checkout';
  static const String orderTracking = '/order-tracking';

  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: restaurantList,
      page: RestaurantListScreen.new,
      binding: BindingsBuilder(() {
        if (!Get.isRegistered<MockRepository>()) {
          Get.lazyPut<MockRepository>(MockRepository.new, fenix: true);
        }
        if (!Get.isRegistered<CheckoutVm>()) {
          Get.put<CheckoutVm>(CheckoutVm(Get.find<MockRepository>()), permanent: true);
        }
        Get.lazyPut<RestaurantListVm>(() => RestaurantListVm(Get.find<MockRepository>()));
      }),
    ),
    GetPage<dynamic>(
      name: foodMenu,
      page: FoodMenuScreen.new,
      binding: BindingsBuilder(() {
        Get.lazyPut<FoodMenuVm>(() => FoodMenuVm(Get.find<MockRepository>(), Get.find<CheckoutVm>()));
      }),
    ),
    GetPage<dynamic>(
      name: checkout,
      page: CheckoutScreen.new,
      binding: BindingsBuilder(() {
        if (!Get.isRegistered<MockRepository>()) {
          Get.lazyPut<MockRepository>(MockRepository.new, fenix: true);
        }
        if (!Get.isRegistered<CheckoutVm>()) {
          Get.put<CheckoutVm>(CheckoutVm(Get.find<MockRepository>()), permanent: true);
        }
      }),
    ),
    GetPage<dynamic>(
      name: orderTracking,
      page: OrderTrackingScreen.new,
      binding: BindingsBuilder(() {
        Get.lazyPut<OrderTrackingVm>(OrderTrackingVm.new);
      }),
    ),
  ];
}
