import 'package:core/constants/string_constants.dart';
import 'package:data/providers/local/user_data_provider.dart';
import 'package:hive/hive.dart';

class UserDataProviderImpl implements UserDataProvider {
  final Box<String> userHiveBox;

  UserDataProviderImpl({
    required this.userHiveBox,
  });

  @override
  bool isUserExists() {
    return userHiveBox.isNotEmpty;
  }

  @override
  Future<void> saveUser(String input) async {
    await userHiveBox.put(StringConstants.uid, input);
  }

  @override
  Future<void> removeUser() async {
    await userHiveBox.clear();
  }

  @override
  String fetchUserId() {
    return userHiveBox.get(StringConstants.uid) ?? '';
  }
}
