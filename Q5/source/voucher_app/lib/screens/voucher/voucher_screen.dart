import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/screen_route.dart';
import 'models/voucher_item.dart';
import 'voucher_vm.dart';
import 'widgets/pay_button.dart';
import 'widgets/voucher_tile.dart';

class VoucherScreen extends StatelessWidget {
  VoucherScreen({super.key});

  final VoucherVM vm = Get.put(VoucherVM());

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Obx(
      () => Scaffold(
        appBar: AppBar(title: const Text('Voucher Selection')),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Select vouchers to pay',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'Choose one or more vouchers below.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.separated(
                    itemCount: vm.vouchers.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (BuildContext context, int index) {
                      final VoucherItem item = vm.vouchers[index];
                      return VoucherTile(
                        item: item,
                        selected: vm.isSelected(item.id),
                        onTap: () => vm.toggleSelection(item.id),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: scheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: scheme.outlineVariant),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Selected: ${vm.selectedVouchers.length}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Total: \$${vm.formatMoney(vm.totalAmount)}',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: scheme.outlineVariant.withValues(alpha: 0.7),
              ),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: scheme.shadow.withValues(alpha: 0.08),
                blurRadius: 16,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            minimum: const EdgeInsets.fromLTRB(24, 14, 24, 16),
            child: PayButton(
              enabled: vm.canPay,
              onPressed: () {
                Get.toNamed(
                  ScreenRoute.payment,
                  arguments: vm.selectedVouchers,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
