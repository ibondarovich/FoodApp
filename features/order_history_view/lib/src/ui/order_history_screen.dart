import 'package:core/core.dart';
import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget{
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(StringConstants.navigationBarOrderHistory),
    );
  }
}