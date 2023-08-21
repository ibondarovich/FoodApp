import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final FetchAllDishesUseCase _fetchAllDishesUseCase;
  final FetchCategoriesUseCase _fetchCategoriesUseCase;
  final SaveCartItemUseCase _saveCartItemUseCase;
  final NetworkInfo _networkInfo;

  MenuBloc({
    required SaveCartItemUseCase saveCartItemUseCase,
    required FetchAllDishesUseCase fetchAllDishesUseCase,
    required NetworkInfo networkInfo,
    required FetchCategoriesUseCase fetchCategoriesUseCase,
  })  : _fetchAllDishesUseCase = fetchAllDishesUseCase,
        _fetchCategoriesUseCase = fetchCategoriesUseCase,
        _saveCartItemUseCase = saveCartItemUseCase,
        _networkInfo = networkInfo,
        super(MenuState(
          dishes: <DishModel>[],
          categories: <CategoryModel>[],
          dishesOfSelectedCategory: <DishModel>[],
        )) {
    on<InitEvent>(_init);
    on<OnSaveItemEvent>(_onSaveItem);
    on<OnChangeItemQuantity>(_onChangeItemQuantity);
    on<OnCheckConnection>(_onCheckInternetConnection);
    on<OnShowMessageEvent>(_onChangeMessageVisibility);
    on<OnNavigateToDetailedPage>(_onNavigateToDetailedPage);
    on<OnSetSelectedCategoryIndex>(_onSetSelectedCategoryIndex);

    add(InitEvent());

    _networkInfo.connectivity.onConnectivityChanged
        .listen((ConnectivityResult event) {
      add(OnCheckConnection());
    });
  }

  void _init(InitEvent event, Emitter<MenuState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final List<DishModel> dishes = await _fetchAllDishesUseCase.execute(
        const NoParams(),
      );
      final List<CategoryModel> categories =
          await _fetchCategoriesUseCase.execute(
        const NoParams(),
      );
      emit(
        state.copyWith(
          dishes: dishes,
          categories: categories,
          isLoading: false,
        ),
      );
      add(OnCheckConnection());
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void _onSaveItem(
    OnSaveItemEvent event,
    Emitter<MenuState> emit,
  ) {
    try {
      _saveCartItemUseCase.execute(
        CartItemModel(
          dishModel: event.dishModel,
          quantity: 1,
        ),
      );
      emit(state.copyWith(isShowSnakbar: false));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isDishAdded: false));
    }
  }

  void _onChangeItemQuantity(
    OnChangeItemQuantity event,
    Emitter<MenuState> emit,
  ) {
    emit(state.copyWith(cartQuantity: event.quantity + 1));
  }

  void _onChangeMessageVisibility(
    OnShowMessageEvent event,
    Emitter<MenuState> emit,
  ) {
    emit(state.copyWith(isShowSnakbar: event.isVisible));
  }

  void _onCheckInternetConnection(
    OnCheckConnection event,
    Emitter<MenuState> emit,
  ) async {
    final bool result = await _networkInfo.isConnected;
    if (result) {
      emit(state.copyWith(isShowSnakbar: false));
    } else {
      emit(state.copyWith(isShowSnakbar: true));
    }
  }

  void _onNavigateToDetailedPage(
    OnNavigateToDetailedPage event,
    Emitter<MenuState> emit,
  ) {
    event.context.router.push(
      DetailedDishRoute(
        dishModel: event.dishModel,
      ),
    );
  }

  void _onSetSelectedCategoryIndex(
    OnSetSelectedCategoryIndex event,
    Emitter<MenuState> emit,
  ) {
    final int categoryId = state.categories[event.index].id;
    final List<DishModel> newDishes = state.dishes
        .where((DishModel dish) => categoryId == dish.categoryId)
        .toList();
    emit(
      state.copyWith(
        selectedCategoryIndex: event.index,
        dishesOfSelectedCategory: newDishes,
      ),
    );
  }
}
