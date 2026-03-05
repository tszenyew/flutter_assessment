import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:voucher_app/main.dart';

void main() {
  setUp(() {
    Get.testMode = true;
  });

  tearDown(() async {
    await Get.deleteAll(force: true);
    Get.reset();
  });

  testWidgets('pay button enables after selection and navigates to QR screen', (WidgetTester tester) async {
    await tester.pumpWidget(const VoucherApp());
    await tester.pumpAndSettle();

    final Finder payButton = find.byKey(const Key('pay_button'));
    FilledButton buttonWidget = tester.widget<FilledButton>(payButton);
    expect(buttonWidget.onPressed, isNull);

    await tester.tap(find.text('Voucher \$2').first);
    await tester.pumpAndSettle();

    buttonWidget = tester.widget<FilledButton>(payButton);
    expect(buttonWidget.onPressed, isNotNull);

    await tester.tap(payButton);
    await tester.pumpAndSettle();

    expect(find.text('QR Code Payment'), findsOneWidget);
    expect(find.byKey(const Key('qr_payload_text')), findsNothing);
    expect(find.byKey(const Key('total_text')), findsOneWidget);
    expect(find.text('\$2'), findsWidgets);
  });
}
