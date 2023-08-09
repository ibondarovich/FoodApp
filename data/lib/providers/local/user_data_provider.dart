abstract class UserDataProvider{
  Future<void> saveUser(String input);
  bool isUserExists();
  Future<void> removeUser();
}