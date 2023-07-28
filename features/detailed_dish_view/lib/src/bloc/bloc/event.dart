part of 'bloc.dart';

@immutable
abstract class DetailedDishViewEvent {}

class OnSaveItemEvent extends DetailedDishViewEvent{
  final DishModel dishModel;

  OnSaveItemEvent({
    required this.dishModel,
  });
}
