part of 'bloc.dart';

@immutable
sealed class OrderHistoryEvent {}

class InitEvent extends OrderHistoryEvent {}

class OnSaveOrderEvent extends OrderHistoryEvent {
  final OrderModel order;

  OnSaveOrderEvent({
    required this.order,
  });
}
