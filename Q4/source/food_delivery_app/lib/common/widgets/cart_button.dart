import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/screen_route.dart';
import '../../screens/checkout/checkout_vm.dart';

class CartButton extends StatelessWidget {
  const CartButton({required this.checkoutVm, super.key});

  final CheckoutVm checkoutVm;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final int count = checkoutVm.totalItems;

      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          IconButton(onPressed: () => Get.toNamed(ScreenRoute.checkout), icon: const Icon(Icons.shopping_cart_outlined), tooltip: 'Open cart'),
          if (count > 0)
            Positioned(
              right: 8,
              top: 8,
              child: IgnorePointer(
                child: Container(
                  constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade300,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                  child: Center(
                    child: Text(
                      '$count',
                      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.black87),
                    ),
                  ),
                ),
              ),
            ),
        ],
      );
    });
  }
}
