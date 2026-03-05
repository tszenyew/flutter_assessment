import 'package:flutter/material.dart';

class ImgListingScreen extends StatefulWidget {
  const ImgListingScreen({super.key, required this.imgCount});
  final int imgCount;

  @override
  State<ImgListingScreen> createState() => _ImgListingScreenState();
}

class _ImgListingScreenState extends State<ImgListingScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.imgCount} Image Listing')),
      body: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: List.generate(widget.imgCount, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  color: Colors.grey[300],
                  child: Image.network(
                    'https://picsum.photos/seed/$index/1000',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
