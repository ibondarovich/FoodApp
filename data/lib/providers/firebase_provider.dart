import 'package:core/core.dart';
import '../entity/dish_entity.dart';

class FirebaseProvider{
  final CollectionReference _dishes;
  FirebaseProvider({
    required dishes
  }) : _dishes = dishes;

  Future<List<DishEntity>> getAllDishes() async {
    final response = await _dishes.doc('Dish').collection('Item').get();
    final result = response.docs.map((doc) => 
        DishEntity.fromJson(doc.data())).toList();
    return result;
  }
}