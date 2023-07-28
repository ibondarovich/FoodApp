part of 'bloc.dart';

@immutable
abstract class MenuViewEvent {}

class InitEvent extends MenuViewEvent {}

class OnSaveItemEvent extends MenuViewEvent {
  final DishModel dishModel;

  OnSaveItemEvent({
    required this.dishModel,
  });
}

class OnChangeItemQuantity extends MenuViewEvent {
  final int quantity;

  OnChangeItemQuantity({
    required this.quantity,
  });
}
