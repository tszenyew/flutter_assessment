import 'package:get/get.dart';

import '../../api/repository/mockRepo/mock_repository.dart';
import '../../routes/screen_route.dart';
import '../checkout/checkout_vm.dart';
import '../restaurant_list/models/restaurant_model.dart';
import 'models/menu_item_model.dart';

class FoodMenuVm extends GetxController {
  FoodMenuVm(this._repository, this._checkoutVm);

  final MockRepository _repository;
  final CheckoutVm _checkoutVm;

  final RxBool isLoading = true.obs;
  final RxList<MenuItemModel> menuItems = <MenuItemModel>[].obs;
  final Rx<RestaurantModel?> selectedRestaurant = Rx<RestaurantModel?>(null);

  @override
  void onInit() {
    super.onInit();
    selectedRestaurant.value = Get.arguments as RestaurantModel?;

    final String? restaurantId = selectedRestaurant.value?.id;
    if (restaurantId != null) {
      loadMenu(restaurantId);
    } else {
      isLoading.value = false;
    }
  }

  Future<void> loadMenu(String restaurantId) async {
    isLoading.value = true;
    final List<MenuItemModel> response = await _repository.getMenuByRestaurant(restaurantId);
    menuItems.assignAll(response);
    isLoading.value = false;
  }

  void addToCart(MenuItemModel item) {
    _checkoutVm.addItem(item);
  }

  void openCheckout() {
    Get.toNamed(ScreenRoute.checkout);
  }
}
