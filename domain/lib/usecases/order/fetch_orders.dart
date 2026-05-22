import 'package:domain/domain.dart';
import 'package:domain/models/order_model.dart';

class FetchOrdersUseCase implements FutureUseCase<String, List<OrderModel>> {
  final OrderRepository _orderRepository;

  FetchOrdersUseCase({
    required OrderRepository orderRepository,
  }) : _orderRepository = orderRepository;

  @override
  Future<List<OrderModel>> execute(String input) {
    return _orderRepository.fetchOrders(input);
  }
}
