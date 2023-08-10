import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, CartPageState> {
  final FetchAllCartItemsUseCase _fetchAllCartItemsUseCase;
  final RemoveCartItemUseCase _removeCartItemUseCase;
  final UpdateCartItemQuantity _updateCartItemQuantity;

  ShoppingCartBloc({
    required FetchAllCartItemsUseCase fetchAllCartItemsUseCase,
    required RemoveCartItemUseCase removeCartItemUseCase,
    required UpdateCartItemQuantity updateCartItemQuantity,
  })  : _fetchAllCartItemsUseCase = fetchAllCartItemsUseCase,
        _removeCartItemUseCase = removeCartItemUseCase,
        _updateCartItemQuantity = updateCartItemQuantity,
        super(
          CartPageState(
            items: <CartItemModel>[],
          ),
        ) {
    on<OnShowCartItems>(_onShowCartItems);
    on<OnDeleteItemEvent>(_onDeleteItem);
    on<OnIncreaseQuantityEvent>(_onIncreaseQuantity);
    on<OnReduceQuantityEvent>(_onReduceQuantity);
    on<OnNavigateToMenuPageEvent>(_onNavigateToMenuPage);

    add(OnShowCartItems());
  }

  void _onShowCartItems(
    OnShowCartItems event,
    Emitter<CartPageState> emit,
  ) {
    emit(state.copyWith(isLoading: true));
    try {
      List<CartItemModel> items = _fetchAllCartItemsUseCase.execute(
        const NoParams(),
      );

      double totalPrice = getTotalPrice(items);

      emit(
        state.copyWith(
          items: items,
          totalPrice: totalPrice,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }

  void _onDeleteItem(
    OnDeleteItemEvent event,
    Emitter<CartPageState> emit,
  ) {
    _removeCartItemUseCase.execute(event.id);
    List<CartItemModel> items = _fetchAllCartItemsUseCase.execute(
      const NoParams(),
    );
    double totalPrice = getTotalPrice(items);
    emit(
      state.copyWith(
        items: items,
        totalPrice: totalPrice,
      ),
    );
  }

  void _onIncreaseQuantity(
    OnIncreaseQuantityEvent event,
    Emitter<CartPageState> emit,
  ) {
    int index = state.items.indexOf(event.cartItemModel);
    final int newQuantity = event.cartItemModel.quantity + 1;
    state.items[index] = event.cartItemModel.copyWith(
      dishModel: event.cartItemModel.dishModel,
      quantity: newQuantity,
    );
    try {
      _updateCartItemQuantity.execute(state.items[index]);
      double totalPrice = getTotalPrice(state.items);
      emit(
        state.copyWith(
          items: state.items,
          totalPrice: totalPrice,
        ),
      );
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  void _onReduceQuantity(
    OnReduceQuantityEvent event,
    Emitter<CartPageState> emit,
  ) {
    if (event.cartItemModel.quantity > 1) {
      final int index = state.items.indexOf(event.cartItemModel);
      final int newQuantity = event.cartItemModel.quantity - 1;
      state.items[index] = event.cartItemModel.copyWith(
        dishModel: event.cartItemModel.dishModel,
        quantity: newQuantity,
      );
      try {
        _updateCartItemQuantity.execute(state.items[index]);
        double totalPrice = getTotalPrice(state.items);
        emit(state.copyWith(items: state.items, totalPrice: totalPrice));
      } catch (e) {
        emit(state.copyWith(errorMessage: e.toString()));
      }
    }
  }

  void _onNavigateToMenuPage(
    OnNavigateToMenuPageEvent event,
    Emitter<CartPageState> emit,
  ) {
    AutoRouter.of(event.context).navigate(const EmptyRoute());
  }

  double getTotalPrice(List<CartItemModel> items) {
    return items.fold(
      0,
      (previousValue, element) =>
          previousValue + element.dishModel.price * element.quantity,
    );
  }
}
