import 'package:data/entity/category_entity/category_entity.dart';
import 'package:data/entity/dish_entity/dish_entity.dart';
import 'package:data/entity/order_entity/order_entity.dart';
import 'package:data/entity/user_entity/user_entity.dart';

abstract class RemoteProvider {
  Future<List<DishEntity>> fetchAllDishes();
  Future<String> createUserWithEmailAndPassword(UserEntity userEntity);
  Future<String> signInWithGoogle();
  Future<void> signOut();
  Future<String> signIn(UserEntity userEntity);
  Future<void> addOrder(OrderEntity input, String uid);
  Future<List<OrderEntity>> fetchOrders(String uid);
  Future<List<CategoryEntity>> fetchCategories();
}
