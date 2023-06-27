import 'package:domain/models/dish_model.dart';
import 'package:domain/repositories/dish_repository.dart';
import 'package:domain/usecases/usecase.dart';

class FetchAllDishesUseCase implements UseCase<NoParams, List<DishModel>>{
  final DishRepository _dishRepository;

  FetchAllDishesUseCase({
    required DishRepository dishRepository,
  }) : _dishRepository = dishRepository;

  @override
  Future<List<DishModel>> execute(NoParams input) async{
    return _dishRepository.fetchAllDishes();
  }
}