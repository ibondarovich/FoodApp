import 'package:flutter/material.dart';

class AppColors{
  static const Color primaryColor = Color(0xFFFF774C);
  static const Color lightOrange = Color(0xFFF9881F);
  static const Color white = Color(0xFFFFFFFF);
  static const Color shadowWhite = Color(0xFFF4F4F4);
  static const Color shadowBlack = Color(0x2202202C);
  static const Color transparent = Color(0x00000000);
  static const Color lightThemeBackground = Color(0xFFFAFAFA);
  static const Color darkThemeBackground = Color(0xFF302F2F);
  static const Color black = Color(0xFF000000);
  static const Color red = Color(0xFFF44437);
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      lightOrange,
      primaryColor,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}