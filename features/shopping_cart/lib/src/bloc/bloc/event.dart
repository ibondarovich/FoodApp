part of 'bloc.dart';

@immutable
abstract class ShoppingCartEvent {}

class OnDeleteItemEvent extends ShoppingCartEvent{
  final int id;

  OnDeleteItemEvent({
    required this.id,
  });
}

class OnIncreaseQuantityEvent extends ShoppingCartEvent {
  final CartItemModel cartItemModel;

  OnIncreaseQuantityEvent({
    required this.cartItemModel,
  });
}

class OnReduceQuantityEvent extends ShoppingCartEvent {
  final CartItemModel cartItemModel;

  OnReduceQuantityEvent({
    required this.cartItemModel,
  });
}

class OnNavigateToMenuPageEvent extends ShoppingCartEvent {
  final BuildContext context;

  OnNavigateToMenuPageEvent({
    required this.context,
  });
}

class OnShowCartItems extends ShoppingCartEvent {}
