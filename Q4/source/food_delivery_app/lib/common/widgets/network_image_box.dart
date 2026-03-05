import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageBox extends StatelessWidget {
  const NetworkImageBox({required this.imageUrl, this.height, this.width, this.borderRadius = 12, super.key});

  final String imageUrl;
  final double? height;
  final double? width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final Color fallbackColor = Theme.of(context).colorScheme.surfaceContainerHighest;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
        fit: BoxFit.cover,
        placeholder: (BuildContext context, String url) {
          return Container(
            height: height,
            width: width,
            color: fallbackColor,
            alignment: Alignment.center,
            child: const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2)),
          );
        },
        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
          return Container(height: height, width: width, color: fallbackColor, child: const Icon(Icons.image_not_supported_outlined));
        },
      ),
    );
  }
}
