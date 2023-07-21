import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class MenuViewBloc extends Bloc<MenuViewEvent, MenuState> {
  final FetchAllDishesUseCase _getAllDishesUseCase;
  final SaveCartItemUseCase _saveCartItemUseCase;

  MenuViewBloc({
    required SaveCartItemUseCase saveCartItemUseCase,
    required FetchAllDishesUseCase getAllDishesUseCase,
  })  : _getAllDishesUseCase = getAllDishesUseCase,
        _saveCartItemUseCase = saveCartItemUseCase,
        super(MenuState(dishes: <DishModel>[])) {
    on<InitEvent>(_init);
    on<OnSaveItemEvent>(_onSaveItem);
    on<OnChangeItemQuantity>(_onChangeItemQuantity);
    add(InitEvent());
  }

  void _init(InitEvent event, Emitter<MenuState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final List<DishModel> dishes = await _getAllDishesUseCase.execute(
        const NoParams(),
      );
      emit(state.copyWith(dishes: dishes, isLoading: false));
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
      emit(state.copyWith());
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  void _onChangeItemQuantity(
    OnChangeItemQuantity event,
    Emitter<MenuState> emit,
  ) {
    emit(state.copyWith(cartQuantity: event.quantity + 1));
  }
}
