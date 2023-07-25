import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class DetailedDishViewBloc
    extends Bloc<DetailedDishViewEvent, DetailedDishViewState> {
  final SaveCartItemUseCase _saveCartItemUseCase;
  DetailedDishViewBloc({
    required SaveCartItemUseCase saveCartItemUseCase,
  })  : _saveCartItemUseCase = saveCartItemUseCase,
        super(DetailedDishViewState()) {
    on<OnSaveItemEvent>(_onSaveItem);
  }

  void _onSaveItem(
    OnSaveItemEvent event,
    Emitter<DetailedDishViewState> emit,
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
}
