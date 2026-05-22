import 'package:domain/domain.dart';

abstract class UserRepository {
  Future<String> createUserWithEmailAndPassword(UserModel model);
  Future<String> signInWithGoogle();
  Future<void> signOut();
  Future<String> signIn(UserModel model);
  Future<void> saveUser(String input);
  String fetchUserId();
  bool isUserExists();
}
