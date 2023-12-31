import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      shadowColor: AppColors.shadowWhite,
      scaffoldBackgroundColor: AppColors.lightThemeBackground,
      appBarTheme: AppBarTheme(
        titleTextStyle: AppFonts.bold_25.copyWith(
          color: AppColors.black,
        ),
      ),
      textTheme: const TextTheme(
        titleSmall: AppFonts.bold_14
      ),
      iconTheme: const IconThemeData(
        color: AppColors.black,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.shadowBlack,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.shadowBlack,
          ),
        ), 
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkThemeBackground,
      appBarTheme: AppBarTheme(
        titleTextStyle: AppFonts.bold_25.copyWith(
          color: AppColors.white,
        ),
      ),
      textTheme: const TextTheme(
        titleSmall: AppFonts.bold_14
      ),
      iconTheme: const IconThemeData(
        color: AppColors.white,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.shadowWhite,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.shadowWhite,
          ),
        ), 
      ),
    );
  }
}