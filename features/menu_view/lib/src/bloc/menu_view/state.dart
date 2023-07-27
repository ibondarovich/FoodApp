part of 'bloc.dart';

class MenuState {
  final List<DishModel> dishes;
  final String errorMessage;
  final bool isLoading;
  final bool isDishAdded;
 // final bool isConnected;
  final bool isShowSnakbar;

  MenuState({
    required this.dishes,
    //this.isConnected = false,
    this.errorMessage = '',
    this.isLoading = false,
    this.isDishAdded = false,
    this.isShowSnakbar = false,
  });

  MenuState copyWith({
    List<DishModel>? dishes,
    int? cartQuantity,
    String? errorMessage,
    bool? isLoading,
    bool? isDishAdded,
    //bool? isConnected,
    bool? isShowSnakbar,
  }) {
    return MenuState(
      dishes: dishes ?? this.dishes,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      isDishAdded: isDishAdded ?? this.isDishAdded,
    //  isConnected: isConnected ?? this.isConnected,
      isShowSnakbar: isShowSnakbar ?? this.isShowSnakbar,
    );
  }
}