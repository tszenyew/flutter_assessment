import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/cart_button.dart';
import '../../routes/screen_route.dart';
import '../checkout/checkout_vm.dart';
import 'food_menu_vm.dart';
import 'widgets/menu_item_card.dart';

class FoodMenuScreen extends GetView<FoodMenuVm> {
  const FoodMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CheckoutVm checkoutVm = Get.find<CheckoutVm>();

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.selectedRestaurant.value?.name ?? 'Menu')),
        actions: <Widget>[CartButton(checkoutVm: checkoutVm)],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.menuItems.isEmpty) {
          return const Center(child: Text('No menu items found.'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: controller.menuItems.length,
          separatorBuilder: (_, index) => const SizedBox(height: 8),
          itemBuilder: (BuildContext context, int index) {
            final item = controller.menuItems[index];
            return MenuItemCard(item: item, onAdd: () => controller.addToCart(item));
          },
        );
      }),
      floatingActionButton: Obx(() {
        if (checkoutVm.totalItems == 0) {
          return const SizedBox.shrink();
        }

        return FloatingActionButton.extended(onPressed: () => Get.toNamed(ScreenRoute.checkout), icon: const Icon(Icons.payment_outlined), label: const Text('Checkout'));
      }),
    );
  }
}
