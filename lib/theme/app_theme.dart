import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      splashFactory: NoSplash.splashFactory,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFc7f46e)),
    );
  }
}
