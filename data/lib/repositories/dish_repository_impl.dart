import 'package:data/mappers/dish_mapper.dart';
import 'package:data/providers/firebase_provider.dart';
import 'package:domain/domain.dart';

class DishRepositoryImpl implements DishRepository{
  final FirebaseProvider _provider;

  DishRepositoryImpl({
    required provider
  }) : _provider = provider;

  @override
  Future<List<DishModel>> fetchAllDishes() async{
    final result = await _provider.getAllDishes();    
    return result.map((item) => DishMapper.toModel(item)).toList();
  }
}