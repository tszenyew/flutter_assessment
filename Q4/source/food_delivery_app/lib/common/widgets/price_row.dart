import 'package:flutter/material.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({required this.label, required this.amount, this.isBold = false, super.key});

  final String label;
  final double amount;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    final TextStyle? baseStyle = Theme.of(context).textTheme.bodyLarge;
    final TextStyle? style = isBold ? baseStyle?.copyWith(fontWeight: FontWeight.w700) : baseStyle;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(label, style: style),
          Text('\$${amount.toStringAsFixed(2)}', style: style),
        ],
      ),
    );
  }
}
