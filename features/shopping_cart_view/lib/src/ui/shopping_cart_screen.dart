import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatelessWidget{
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(StringConstants.navigationBarCart),
    );
  }
}