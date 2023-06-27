import 'package:bloc/bloc.dart';
import 'package:domain/models/dish_model.dart';
import 'package:domain/usecases/fetch_all_dishes.dart';
import 'package:domain/usecases/usecase.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class MenuViewBloc extends Bloc<MenuViewEvent, MenuViewState> {
  final FetchAllDishesUseCase _getAllDishesUseCase;

  MenuViewBloc({
    required FetchAllDishesUseCase getAllDishesUseCase
  }) : _getAllDishesUseCase = getAllDishesUseCase,
      super(EmptyState()){
    on<InitEvent>(_init);
    add(InitEvent());
  }

  void _init(InitEvent event, Emitter<MenuViewState> emit) async {
    emit(LoadingState());
    try{
      final List<DishModel> dishes =
          await _getAllDishesUseCase.execute(const NoParams());
      emit(LoadedState(dishes: dishes));
    }catch(e){
      emit(ErrorState(errorMessage: e.toString()));      
    }
  }
}
