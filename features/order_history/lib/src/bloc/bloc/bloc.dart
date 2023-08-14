import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/models/order_model.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class OrderHistoryBloc extends Bloc<OrderHistoryEvent, OrderHistoryState> {
  final FetchOrdersUseCase _fetchOrderUseCase;
  final FetchUserIdUseCase _fetchUserIdUseCase;

  OrderHistoryBloc({
    required FetchOrdersUseCase fetchOrderUseCase,
    required FetchUserIdUseCase fetchUserIdUseCase,
  })  : _fetchOrderUseCase = fetchOrderUseCase,
        _fetchUserIdUseCase = fetchUserIdUseCase,
        super(OrderHistoryState(orders: <OrderModel>[], isLoading: false)) {
    on<InitEvent>(_init);

    add(InitEvent());
  }

  void _init(
    InitEvent event,
    Emitter<OrderHistoryState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final String uid = _fetchUserIdUseCase.execute(const NoParams());
    final List<OrderModel> result = await _fetchOrderUseCase.execute(uid);
    emit(state.copyWith(orders: result, isLoading: false));
  }
}
