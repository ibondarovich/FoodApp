import 'package:domain/models/order_model.dart';

abstract class OrderRepository {
  Future<List<OrderModel>> fetchOrders(String input);
  Future<void> saveOrder(OrderModel input);
}
