import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/screen_route.dart';

void main() {
  runApp(const VoucherApp());
}

class VoucherApp extends StatelessWidget {
  const VoucherApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primary = Color(0xFF1F3A5F);
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.light,
      primary: primary,
    );

    return GetMaterialApp(
      title: 'VoucherQRPay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: scheme,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          centerTitle: false,
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: scheme.onSurface,
          titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: scheme.onSurface,
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 1.5,
          color: scheme.surface,
          shadowColor: scheme.shadow.withValues(alpha: 0.10),
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            minimumSize: const WidgetStatePropertyAll<Size>(
              Size.fromHeight(54),
            ),
            shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            elevation: WidgetStateProperty.resolveWith<double>(
              (Set<WidgetState> states) =>
                  states.contains(WidgetState.disabled) ? 0 : 1,
            ),
          ),
        ),
        listTileTheme: ListTileThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
        ),
      ),
      initialRoute: ScreenRoute.voucher,
      getPages: ScreenRoute.pages,
    );
  }
}
