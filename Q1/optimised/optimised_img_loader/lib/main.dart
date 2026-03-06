import 'package:flutter/material.dart';
import 'package:optimised_img_loader/pages/landing/landing_screen.dart';

void main() {
  runApp(const OptimisedApp());
}

class OptimisedApp extends StatelessWidget {
  const OptimisedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Optimised List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        scrollbarTheme: const ScrollbarThemeData(
          thumbColor: WidgetStatePropertyAll(Colors.green),
          thickness: WidgetStatePropertyAll(4.0),
          radius: Radius.circular(4.0),
        ),
      ),
      home: const LandingScreen(),
    );
  }
}
