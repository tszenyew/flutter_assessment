import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/price_row.dart';
import '../../routes/screen_route.dart';
import 'checkout_vm.dart';
import 'models/cart_item_model.dart';
import 'widgets/cart_item_tile.dart';

class CheckoutScreen extends GetView<CheckoutVm> {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(Icons.shopping_cart_outlined, size: 64),
                const SizedBox(height: 12),
                const Text('Your cart is empty.'),
                const SizedBox(height: 12),
                OutlinedButton(onPressed: () => Get.offAllNamed(ScreenRoute.restaurantList), child: const Text('Browse Restaurants')),
              ],
            ),
          );
        }

        return Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: controller.cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final CartItemModel item = controller.cartItems[index];
                  return CartItemTile(item: item, onIncrease: () => controller.increaseQuantity(item), onDecrease: () => controller.decreaseQuantity(item));
                },
              ),
            ),
            SafeArea(
              top: false,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  boxShadow: const <BoxShadow>[BoxShadow(color: Colors.black12, blurRadius: 8)],
                ),
                child: Column(
                  children: <Widget>[
                    PriceRow(label: 'Subtotal', amount: controller.subtotal),
                    PriceRow(label: 'Delivery Fee', amount: controller.deliveryFee),
                    const Divider(height: 18),
                    PriceRow(label: 'Total', amount: controller.total, isBold: true),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () async {
                          final order = await controller.placeOrder();
                          Get.offNamed(ScreenRoute.orderTracking, arguments: order);
                        },
                        child: const Text('Place Order'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
