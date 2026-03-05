import 'package:flutter/material.dart';

import '../../../common/widgets/network_image_box.dart';
import '../models/menu_item_model.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({required this.item, required this.onAdd, super.key});

  final MenuItemModel item;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: <Widget>[
            NetworkImageBox(imageUrl: item.imageUrl, height: 84, width: 84),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(item.name, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 6),
                  Text('\$${item.price.toStringAsFixed(2)}'),
                ],
              ),
            ),
            FilledButton.icon(onPressed: onAdd, icon: const Icon(Icons.add_shopping_cart_outlined), label: const Text('Add to Cart')),
          ],
        ),
      ),
    );
  }
}
