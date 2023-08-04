import 'package:data/entity/dish_entity/dish_entity.dart';
import 'package:data/entity/user_entity/user_entity.dart';

abstract class RemoteProvider {
  Future<List<DishEntity>> getAllDishes();
  Future<String> createUserWithEmailAndPassword(UserEntity userEntity);
  Future<String> signInWithGoogle();
  Future<void> signOut();
  Future<String> signIn(UserEntity userEntity);
}
