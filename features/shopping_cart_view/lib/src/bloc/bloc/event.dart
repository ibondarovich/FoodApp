part of 'bloc.dart';

@immutable
abstract class ShoppingCartViewEvent {}

class OnDeleteItemEvent extends ShoppingCartViewEvent{
  final int id;

  OnDeleteItemEvent({
    required this.id,
  });
}

class OnIncreaseQuantityEvent extends ShoppingCartViewEvent {
  final CartItemModel cartItemModel;

  OnIncreaseQuantityEvent({
    required this.cartItemModel,
  });
}

class OnReduceQuantityEvent extends ShoppingCartViewEvent {
  final CartItemModel cartItemModel;

  OnReduceQuantityEvent({
    required this.cartItemModel,
  });
}

class OnShowCartItems extends ShoppingCartViewEvent {}
