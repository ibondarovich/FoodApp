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

class OnCheckConnection extends MenuViewEvent {}

class OnShowMessageEvent extends MenuViewEvent {
  final bool isVisible;

  OnShowMessageEvent({
    required this.isVisible,
  });
}

class OnNavigateToDetailedPage extends MenuViewEvent {
  final BuildContext context;
  final DishModel dishModel;

  OnNavigateToDetailedPage({
    required this.context,
    required this.dishModel,
  });
}