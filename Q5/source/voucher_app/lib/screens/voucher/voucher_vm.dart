import 'package:get/get.dart';

import '../../api/repository/mock_repo.dart';
import 'models/voucher_item.dart';

class VoucherVM extends GetxController {
  VoucherVM({MockRepo? repo}) : _repo = repo ?? MockRepo();

  final MockRepo _repo;

  final RxList<VoucherItem> vouchers = <VoucherItem>[].obs;
  final RxSet<int> selectedIds = <int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    vouchers.assignAll(_repo.getVouchers());
  }

  void toggleSelection(int id) {
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }
  }

  bool isSelected(int id) {
    return selectedIds.contains(id);
  }

  List<VoucherItem> get selectedVouchers {
    return vouchers
        .where((VoucherItem item) => selectedIds.contains(item.id))
        .toList();
  }

  bool get canPay => selectedIds.isNotEmpty;

  double get totalAmount {
    return selectedVouchers.fold<double>(
      0,
      (double total, VoucherItem item) => total + item.amount,
    );
  }

  String get qrPayload {
    return selectedVouchers
        .map((VoucherItem item) => item.payloadValue)
        .join(',');
  }

  String formatMoney(double value) {
    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }
    return value.toStringAsFixed(2);
  }
}
