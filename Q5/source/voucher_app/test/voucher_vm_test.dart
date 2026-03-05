import 'package:flutter_test/flutter_test.dart';
import 'package:voucher_app/screens/voucher/voucher_vm.dart';

void main() {
  group('VoucherVM', () {
    test('loads six vouchers from mock repo', () {
      final VoucherVM vm = VoucherVM();

      vm.onInit();

      expect(vm.vouchers.length, 6);
      expect(vm.vouchers.where((item) => item.amount == 2).length, 2);
      expect(vm.vouchers.where((item) => item.amount == 5).length, 2);
      expect(vm.vouchers.where((item) => item.amount == 10).length, 2);
    });

    test('supports independent instance selection and totals', () {
      final VoucherVM vm = VoucherVM();
      vm.onInit();

      vm.toggleSelection(1); // $2
      vm.toggleSelection(2); // $2
      vm.toggleSelection(6); // $10

      expect(vm.canPay, isTrue);
      expect(vm.selectedVouchers.length, 3);
      expect(vm.qrPayload, '2,2,10');
      expect(vm.totalAmount, 14);
    });

    test('disables pay when all selections are cleared', () {
      final VoucherVM vm = VoucherVM();
      vm.onInit();

      vm.toggleSelection(3);
      expect(vm.canPay, isTrue);

      vm.toggleSelection(3);
      expect(vm.canPay, isFalse);
      expect(vm.qrPayload, isEmpty);
      expect(vm.totalAmount, 0);
    });
  });
}
