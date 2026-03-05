import 'package:flutter/material.dart';

import '../../../common/widgets/network_image_box.dart';
import '../models/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({required this.restaurant, required this.onTap, super.key});

  final RestaurantModel restaurant;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NetworkImageBox(imageUrl: restaurant.imageUrl, height: 160, width: double.infinity, borderRadius: 0),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(restaurant.name, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 6),
                  Row(
                    children: <Widget>[
                      Icon(Icons.star_rounded, size: 18, color: Colors.amber.shade700),
                      const SizedBox(width: 4),
                      Text(restaurant.rating.toStringAsFixed(1)),
                      const SizedBox(width: 12),
                      Text(restaurant.cuisineType),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
