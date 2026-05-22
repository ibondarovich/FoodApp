abstract class UserDataProvider {
  Future<void> saveUser(String input);
  Future<void> removeUser();
  String fetchUserId();
  bool isUserExists();
}
