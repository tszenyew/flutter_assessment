import 'package:flutter/material.dart';

class PayButton extends StatelessWidget {
  const PayButton({super.key, required this.enabled, required this.onPressed});

  final bool enabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        key: const Key('pay_button'),
        onPressed: enabled ? onPressed : null,
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.qr_code_scanner_rounded, size: 21),
            SizedBox(width: 10),
            Text('Pay Now'),
          ],
        ),
      ),
    );
  }
}
