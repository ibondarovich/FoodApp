part of 'bloc.dart';

final class OrderHistoryState {
  final List<OrderModel> orders;
  final bool isLoading;

  OrderHistoryState({
    required this.orders,
    required this.isLoading,
  });

  OrderHistoryState copyWith({
    List<OrderModel>? orders,
    bool? isLoading,
  }) {
    return OrderHistoryState(
      orders: orders ?? this.orders,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
