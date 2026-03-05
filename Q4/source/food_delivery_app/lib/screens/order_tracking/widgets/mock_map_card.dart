import 'package:flutter/material.dart';

class MockMapCard extends StatelessWidget {
  const MockMapCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: <Color>[Color(0xFFDAF5EC), Color(0xFFEAF3FF)]),
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: const Alignment(-0.65, -0.20),
            child: Container(width: 120, height: 6, color: Colors.white70),
          ),
          Align(
            alignment: const Alignment(0.45, 0.2),
            child: Container(width: 90, height: 6, color: Colors.white70),
          ),
          const Align(
            alignment: Alignment(-0.75, -0.45),
            child: Icon(Icons.storefront_rounded, color: Colors.teal, size: 34),
          ),
          const Align(
            alignment: Alignment(0.70, 0.4),
            child: Icon(Icons.home_rounded, color: Colors.indigo, size: 34),
          ),
          const Align(
            alignment: Alignment(0.0, -0.05),
            child: Icon(Icons.delivery_dining_rounded, color: Colors.deepOrange, size: 34),
          ),
        ],
      ),
    );
  }
}
