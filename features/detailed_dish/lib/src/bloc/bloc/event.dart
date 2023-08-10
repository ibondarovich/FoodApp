part of 'bloc.dart';

@immutable
abstract class DetailedDishEvent {}

class OnSaveItemEvent extends DetailedDishEvent{
  final DishModel dishModel;

  OnSaveItemEvent({
    required this.dishModel,
  });
}
