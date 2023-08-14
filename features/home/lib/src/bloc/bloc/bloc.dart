import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class HomeBloc extends Bloc<HomeEvent, OnChangeCartQuntityState> {
  final FetchAllCartItemsUseCase _fetchAllCartItemsUseCase;

  HomeBloc({required FetchAllCartItemsUseCase fetchAllCartItemsUseCase})
      : _fetchAllCartItemsUseCase = fetchAllCartItemsUseCase,
        super(OnChangeCartQuntityState(quantity: 0)) {
    on<OnChangeCartQuntityEvent>(_onChangeCartQuantity);
    
    add(OnChangeCartQuntityEvent());
  }

  void _onChangeCartQuantity(
    OnChangeCartQuntityEvent event,
    Emitter<OnChangeCartQuntityState> emit,
  ) {
    final List<CartItemModel> cartItems =
        _fetchAllCartItemsUseCase.execute(const NoParams());

    int count = cartItems.fold(
      0,
      (previousValue, element) => previousValue + element.quantity,
    );

    emit(OnChangeCartQuntityState(quantity: count));
  }
}
