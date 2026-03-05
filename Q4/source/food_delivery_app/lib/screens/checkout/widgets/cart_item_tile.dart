import 'package:flutter/material.dart';

import '../models/cart_item_model.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({required this.item, required this.onIncrease, required this.onDecrease, super.key});

  final CartItemModel item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(item.menuItem.name, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 6),
                  Text('\$${item.menuItem.price.toStringAsFixed(2)} each'),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                IconButton(onPressed: onDecrease, icon: const Icon(Icons.remove_circle_outline)),
                Text('${item.quantity}'),
                IconButton(onPressed: onIncrease, icon: const Icon(Icons.add_circle_outline)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
