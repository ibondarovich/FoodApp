import 'package:data/entity/user_entity/user_entity.dart';
import 'package:data/mappers/signin_user_mapper.dart';
import 'package:data/providers/local/local_provider.dart';
import 'package:data/providers/remote/remote_provider.dart';
import 'package:domain/domain.dart';

class UserRepositoryImpl extends UserRepository {
  final RemoteProvider _remoteProvider;
  final LocalProvider _localProvider;

  UserRepositoryImpl({
    required RemoteProvider remoteProvider,
    required LocalProvider localProvider,
  }) : _remoteProvider = remoteProvider,
      _localProvider = localProvider;

  @override
  Future<String> createUserWithEmailAndPassword(UserModel model) async {
    final UserEntity entity = UserMapper.toEntity(model);
    return _remoteProvider.createUserWithEmailAndPassword(entity);
  }
  
  @override
  Future<String> signInWithGoogle() async {
    return await _remoteProvider.signInWithGoogle();
  }

  @override
  Future<void> signOut() async {
    await _remoteProvider.signOut();
    await _localProvider.removeUser();
  }
  
  @override
  Future<String> signIn(UserModel model) async {
    final UserEntity entity = UserMapper.toEntity(model);
    return await _remoteProvider.signIn(entity);
  }
  
  @override
  bool checkUser() {
    return _localProvider.checkUser();
  }
  
  @override
  Future<void> saveUser(String input) async {
    await _localProvider.saveUser(input);
  }
}
