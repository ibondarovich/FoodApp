part of 'bloc.dart';

@immutable
abstract class ShoppingCartViewState {}

class CartPageState {
  final List<CartItemModel> items;
  final double totalPrice;
  final String errorMessage;
  final bool isLoading;

  CartPageState({
    required this.items,
    this.totalPrice = 0,
    this.errorMessage = '',
    this.isLoading = false,
  });

  CartPageState copyWith({
    List<CartItemModel>? items,
    double? totalPrice,
    String? errorMessage,
    bool? isLoading,
  }) {
    return CartPageState(
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
