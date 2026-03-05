class VoucherItem {
  const VoucherItem({required this.id, required this.amount});

  final int id;
  final double amount;

  String get amountLabel {
    if (amount == amount.roundToDouble()) {
      return amount.toInt().toString();
    }
    return amount.toStringAsFixed(2);
  }

  String get payloadValue {
    if (amount == amount.roundToDouble()) {
      return amount.toInt().toString();
    }
    return amount.toStringAsFixed(2);
  }
}
