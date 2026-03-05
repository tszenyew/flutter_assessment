import 'package:get/get.dart';

import '../screens/payment/payment_screen.dart';
import '../screens/voucher/voucher_screen.dart';

class ScreenRoute {
  static const String voucher = '/voucher';
  static const String payment = '/payment';

  static final List<GetPage> pages = <GetPage>[
    GetPage(name: voucher, page: () => VoucherScreen()),
    GetPage(name: payment, page: () => const PaymentScreen()),
  ];
}
