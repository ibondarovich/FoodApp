import 'package:domain/domain.dart';
import 'package:domain/models/order_model.dart';

class SaveOrderUseCase implements FutureUseCase<OrderModel, void>{
  final OrderRepository _orderRepository;

  SaveOrderUseCase({
    required OrderRepository orderRepository,
  }) : _orderRepository = orderRepository;

  @override
  Future<void> execute(OrderModel input) async {
    return _orderRepository.saveOrder(input);
  }
}