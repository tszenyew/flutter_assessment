import 'package:flutter/material.dart';
import 'package:optimised_img_loader/pages/img_listing/img_listing_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});
  static const List<int> imgCounts = [100, 250, 500, 1000];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Optimised 1,000 Images')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            const Text('This is an optimised implementation of a list with 1,000 images.'),
            const Text('It will handle performance better by optimising image loading.'),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 12,
                children: [
                  ...imgCounts.map((count) {
                    return ElevatedButton(onPressed: () => navigateToImgListingScreen(context, count), child: Text('View $count Images'));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToImgListingScreen(BuildContext context, int imgCount) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ImgListingScreen(imgCount: imgCount)));
  }
}
