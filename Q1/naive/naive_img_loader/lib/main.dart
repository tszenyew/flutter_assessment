import 'package:flutter/material.dart';
import 'package:naive_img_loader/pages/img_listing/img_listing_screen.dart';
import 'package:naive_img_loader/pages/landing/landing_screen.dart';

void main() {
  runApp(const NaiveApp());
}

class NaiveApp extends StatelessWidget {
  const NaiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Naïve List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.deepPurple, foregroundColor: Colors.white, elevation: 0),
        scrollbarTheme: ScrollbarThemeData(thumbColor: WidgetStatePropertyAll(Colors.deepPurple), thickness: WidgetStatePropertyAll(4.0), radius: const Radius.circular(4.0)),
      ),
      home: const LandingScreen(),
    );
  }
}
