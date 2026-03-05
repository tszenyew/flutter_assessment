import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/cart_button.dart';
import '../checkout/checkout_vm.dart';
import 'restaurant_list_vm.dart';
import 'widgets/restaurant_card.dart';

class RestaurantListScreen extends GetView<RestaurantListVm> {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CheckoutVm checkoutVm = Get.find<CheckoutVm>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants'),
        actions: <Widget>[CartButton(checkoutVm: checkoutVm)],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: controller.restaurants.length,
          separatorBuilder: (_, index) => const SizedBox(height: 8),
          itemBuilder: (BuildContext context, int index) {
            final restaurant = controller.restaurants[index];
            return RestaurantCard(restaurant: restaurant, onTap: () => controller.openRestaurantMenu(restaurant));
          },
        );
      }),
    );
  }
}
