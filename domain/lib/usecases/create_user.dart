import 'package:domain/domain.dart';

class CreateUserUseCase extends FutureUseCase<UserModel, String> {
  final UserRepository _userRepository;

  CreateUserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<String> execute(UserModel input) async {
    return await _userRepository.createUserWithEmailAndPassword(input);
  }
}
