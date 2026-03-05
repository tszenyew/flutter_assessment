import 'package:get/get.dart';

import '../../api/repository/mockRepo/mock_repository.dart';
import '../../routes/screen_route.dart';
import 'models/restaurant_model.dart';

class RestaurantListVm extends GetxController {
  RestaurantListVm(this._repository);

  final MockRepository _repository;

  final RxBool isLoading = true.obs;
  final RxList<RestaurantModel> restaurants = <RestaurantModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadRestaurants();
  }

  Future<void> loadRestaurants() async {
    isLoading.value = true;
    final List<RestaurantModel> response = await _repository.getRestaurants();
    restaurants.assignAll(response);
    isLoading.value = false;
  }

  void openRestaurantMenu(RestaurantModel restaurant) {
    Get.toNamed(ScreenRoute.foodMenu, arguments: restaurant);
  }
}
