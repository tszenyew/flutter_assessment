import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/screen_route.dart';
import 'models/order_model.dart';
import 'order_tracking_vm.dart';
import 'widgets/mock_map_card.dart';

class OrderTrackingScreen extends GetView<OrderTrackingVm> {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Track Order')),
      body: Obx(() {
        final order = controller.currentOrder.value;
        final status = controller.status.value;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(order == null ? 'Order in progress' : 'Order ${order.id}', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              const MockMapCard(),
              const SizedBox(height: 18),
              _StatusStepRow(currentStatus: status, label: 'Preparing', stepStatus: OrderStatus.preparing),
              _StatusStepRow(currentStatus: status, label: 'On the way', stepStatus: OrderStatus.onTheWay),
              _StatusStepRow(currentStatus: status, label: 'Delivered', stepStatus: OrderStatus.delivered),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: FilledButton.tonal(onPressed: () => Get.offAllNamed(ScreenRoute.restaurantList), child: const Text('Back to Restaurants')),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _StatusStepRow extends StatelessWidget {
  const _StatusStepRow({required this.currentStatus, required this.label, required this.stepStatus});

  final OrderStatus currentStatus;
  final String label;
  final OrderStatus stepStatus;

  @override
  Widget build(BuildContext context) {
    final bool isDone = currentStatus.index >= stepStatus.index;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: isDone ? Theme.of(context).colorScheme.primaryContainer : Theme.of(context).colorScheme.surfaceContainerHighest, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: <Widget>[
          Icon(isDone ? Icons.check_circle_rounded : Icons.radio_button_unchecked, color: isDone ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.outline),
          const SizedBox(width: 10),
          Text(label),
        ],
      ),
    );
  }
}
