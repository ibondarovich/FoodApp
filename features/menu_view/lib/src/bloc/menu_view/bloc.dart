import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class MenuViewBloc extends Bloc<MenuViewEvent, MenuState> {
  final FetchAllDishesUseCase _fetchAllDishesUseCase;
  final SaveCartItemUseCase _saveCartItemUseCase;
  final NetworkInfo _networkInfo;

  MenuViewBloc({
    required SaveCartItemUseCase saveCartItemUseCase,
    required FetchAllDishesUseCase fetchAllDishesUseCase,
    required NetworkInfo networkInfo
  })  : _fetchAllDishesUseCase = fetchAllDishesUseCase,
        _saveCartItemUseCase = saveCartItemUseCase,
        _networkInfo = networkInfo,
        super(MenuState(dishes: <DishModel>[],)) {

    on<InitEvent>(_init);
    on<OnSaveItemEvent>(_onSaveItem);
    on<OnChangeItemQuantity>(_onChangeItemQuantity);
    on<OnCheckConnection>(_onCheckInternetConnection);
    on<OnShowMessageEvent>(_onChangeMessageVIsibility);
    on<OnNavigateToDetailedPage>(_onNavigateToDetailedPage);
    
    add(InitEvent());

    _networkInfo.connectivity.onConnectivityChanged.listen((event) {
      add(OnCheckConnection());
    });
  }

  void _init(InitEvent event, Emitter<MenuState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final List<DishModel> dishes = await _fetchAllDishesUseCase.execute(
        const NoParams(),
      );
      emit(state.copyWith(dishes: dishes, isLoading: false));
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

  void _onChangeMessageVIsibility(
    OnShowMessageEvent event,
    Emitter<MenuState> emit,
  ){
    emit(state.copyWith(isShowSnakbar: event.isVisible));
  }

  void _onCheckInternetConnection(
    OnCheckConnection event,
    Emitter<MenuState> emit,
  ) async {
    final bool result = await _networkInfo.isConnected;
    if(result){
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
}
