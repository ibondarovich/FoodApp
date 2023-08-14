part of 'bloc.dart';

@immutable
abstract class MenuEvent {}

class InitEvent extends MenuEvent {}

class OnSaveItemEvent extends MenuEvent {
  final DishModel dishModel;

  OnSaveItemEvent({
    required this.dishModel,
  });
}

class OnChangeItemQuantity extends MenuEvent {
  final int quantity;

  OnChangeItemQuantity({
    required this.quantity,
  });
}

class OnCheckConnection extends MenuEvent {}

class OnShowMessageEvent extends MenuEvent {
  final bool isVisible;

  OnShowMessageEvent({
    required this.isVisible,
  });
}

class OnNavigateToDetailedPage extends MenuEvent {
  final BuildContext context;
  final DishModel dishModel;

  OnNavigateToDetailedPage({
    required this.context,
    required this.dishModel,
  });
}