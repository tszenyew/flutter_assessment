import '../../screens/voucher/models/voucher_item.dart';
import '../data/mock_data.dart';

class MockRepo {
  List<VoucherItem> getVouchers() {
    return List<VoucherItem>.from(kVoucherItems);
  }
}
