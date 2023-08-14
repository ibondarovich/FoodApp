part of 'bloc.dart';

class MenuState {
  final List<DishModel> dishes;
  final List<DishModel> dishesOfSelectedCategory;
  final List<CategoryModel> categories;
  final String errorMessage;
  final bool isLoading;
  final bool isDishAdded;
  final bool isShowSnakbar;
  final int selectedCategoryIndex;

  MenuState({
    required this.dishes,
    required this.categories,
    this.errorMessage = '',
    this.isLoading = false,
    this.isDishAdded = false,
    this.isShowSnakbar = false,
    this.selectedCategoryIndex = 0,
    required this.dishesOfSelectedCategory,
  });

  MenuState copyWith({
    List<DishModel>? dishes,
    int? cartQuantity,
    String? errorMessage,
    bool? isLoading,
    bool? isDishAdded,
    bool? isShowSnakbar,
    int? selectedCategoryIndex,
    List<CategoryModel>? categories,
    List<DishModel>? dishesOfSelectedCategory,
  }) {
    return MenuState(
      dishes: dishes ?? this.dishes,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      isDishAdded: isDishAdded ?? this.isDishAdded,
      isShowSnakbar: isShowSnakbar ?? this.isShowSnakbar,
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
      categories: categories ?? this.categories,
      dishesOfSelectedCategory:
          dishesOfSelectedCategory ?? this.dishesOfSelectedCategory,
    );
  }
}
