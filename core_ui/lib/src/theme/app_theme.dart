import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      shadowColor: AppColors.shadowWhite,
      scaffoldBackgroundColor: AppColors.lightThemeBackground,
      appBarTheme: const AppBarTheme(
        titleTextStyle: AppFonts.titleLightThemeStyle
      ),
      textTheme: const TextTheme(
        titleSmall: AppFonts.bold_14
      ),
      iconTheme: const IconThemeData(
        color: AppColors.black,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkThemeBackground,
      appBarTheme: const AppBarTheme(
        titleTextStyle: AppFonts.titleDarkThemeStyle
      ),
      textTheme: const TextTheme(
        titleSmall: AppFonts.bold_14
      ),
      iconTheme: const IconThemeData(
        color: AppColors.white,
      ),
    );
  }
}