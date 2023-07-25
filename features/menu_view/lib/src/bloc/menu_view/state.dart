part of 'bloc.dart';

class MenuState {
  final List<DishModel> dishes;
  final String errorMessage;
  final bool isLoading;
  final bool isDishAdded;

  MenuState({
    required this.dishes,
    this.errorMessage = '',
    this.isLoading = false,
    this.isDishAdded = false,
  });

  MenuState copyWith({
    List<DishModel>? dishes,
    int? cartQuantity,
    String? errorMessage,
    bool? isLoading,
    bool? isDishAdded,
  }) {
    return MenuState(
      dishes: dishes ?? this.dishes,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      isDishAdded: isDishAdded ?? this.isDishAdded,
    );
  }
}
