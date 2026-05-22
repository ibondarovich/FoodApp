import 'package:domain/domain.dart';

class OrderModel {
  final int id;
  final DateTime dateTimeOfIssuance;
  final double price;
  final List<CartItemModel> orderedItems;

  OrderModel({
    required this.id,
    required this.dateTimeOfIssuance,
    required this.price,
    required this.orderedItems,
  });
}
