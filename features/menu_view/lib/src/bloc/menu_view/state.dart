part of 'bloc.dart';

@immutable
abstract class MenuViewState {}

class EmptyState extends MenuViewState {}

class LoadingState extends MenuViewState {}

class LoadedState extends MenuViewState {
  final List<DishModel> dishes;

  LoadedState({required this.dishes});
}

class ErrorState extends MenuViewState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
