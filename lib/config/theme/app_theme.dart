import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getAppTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0x00353d48),
        secondary: const Color(0x0086B7B8),
        tertiary: const Color(0x009A85FC),
        brightness: Brightness.dark,
      ),
      brightness: Brightness.dark
    );
  }
}