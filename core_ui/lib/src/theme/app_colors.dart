import 'package:flutter/material.dart';

class AppColors{
  static const Color primaryColor = Color(0xFFFF774C);
  static const Color lightOrange = Color(0xFFF9881F);
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      lightOrange,
      primaryColor,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color shadowWhite = Color.fromRGBO(244, 244, 244, 1);
  static const Color shadowBlack = Color.fromARGB(10, 2, 32, 44);
  static const Color transparent = Color.fromRGBO(0, 0, 0, 0);
  static const Color lightThemeBackground = Color.fromRGBO(250, 250, 250, 1);
  static const Color darkThemeBackground = Color.fromRGBO(48, 47, 47, 1);
  static const Color black = Color.fromRGBO(0, 0, 0, 1);
}