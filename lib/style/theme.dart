import 'package:flutter/material.dart';
import 'package:mobigic/style/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      labelLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      labelMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      labelSmall:
          TextStyle(fontWeight: FontWeight.w400, color: AppColors.primary),
    ),
  );
}
