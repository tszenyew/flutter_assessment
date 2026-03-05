import 'dart:async';

import 'package:get/get.dart';

import 'models/order_model.dart';

class OrderTrackingVm extends GetxController {
  final Rx<OrderModel?> currentOrder = Rx<OrderModel?>(null);
  final Rx<OrderStatus> status = OrderStatus.preparing.obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();

    final OrderModel? order = Get.arguments as OrderModel?;
    currentOrder.value = order;
    status.value = order?.status ?? OrderStatus.preparing;

    _startStatusFlow();
  }

  void _startStatusFlow() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (status.value == OrderStatus.delivered) {
        timer.cancel();
        return;
      }

      if (status.value == OrderStatus.preparing) {
        status.value = OrderStatus.onTheWay;
      } else if (status.value == OrderStatus.onTheWay) {
        status.value = OrderStatus.delivered;
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
