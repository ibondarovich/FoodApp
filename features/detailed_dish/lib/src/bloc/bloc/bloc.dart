import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class DetailedDishBloc
    extends Bloc<DetailedDishEvent, DetailedDishState> {
  final SaveCartItemUseCase _saveCartItemUseCase;

  DetailedDishBloc({
    required SaveCartItemUseCase saveCartItemUseCase,
  })  : _saveCartItemUseCase = saveCartItemUseCase,
        super(DetailedDishState()) {
    on<OnSaveItemEvent>(_onSaveItem);
  }

  void _onSaveItem(
    OnSaveItemEvent event,
    Emitter<DetailedDishState> emit,
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
