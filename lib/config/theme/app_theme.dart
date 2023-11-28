import 'package:flutter/material.dart';
import 'package:habit_app/config/theme/custom_color.g.dart';


class AppTheme {

  ThemeData getAppTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0x00353d48),
        brightness: Brightness.dark,
      ),
      extensions: [darkCustomColors]
    );
  }
}