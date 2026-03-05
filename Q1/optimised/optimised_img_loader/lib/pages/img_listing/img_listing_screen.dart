import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImgListingScreen extends StatelessWidget {
  const ImgListingScreen({super.key, required this.imgCount});
  final int imgCount;
  static const imgHeight = 200.0;
  static const imgVerticalPadding = 8.0;

  @override
  Widget build(BuildContext context) {
    final itemHeight =
        ImgListingScreen.imgHeight + 2 * ImgListingScreen.imgVerticalPadding;

    return Scaffold(
      appBar: AppBar(title: Text('$imgCount Image Listing')),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: imgCount,
          itemExtent: itemHeight,
          cacheExtent: itemHeight * 3, // Cache 3 items ahead
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: ImgListingScreen.imgVerticalPadding,
              ),
              child: Container(
                color: Colors.grey[300],
                child: CachedNetworkImage(
                  imageUrl: 'https://picsum.photos/seed/$index/1000',
                  memCacheWidth: 600,
                  fit: BoxFit.cover,
                  errorBuilder: (context, url, error) => Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image, color: Colors.grey),
                  ),
                  disablePlaceholderOnCacheHit: false,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
