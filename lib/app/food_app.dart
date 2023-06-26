import 'package:flutter/material.dart';
import 'package:menu_view/menu_view.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuViewScreen(),
    );
  }
}