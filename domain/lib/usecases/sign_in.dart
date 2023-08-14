import 'package:domain/domain.dart';

class SignInUseCase extends FutureUseCase<UserModel, String> {
  final UserRepository _userRepository;

  SignInUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<String> execute(UserModel input) async {
    return await _userRepository.signIn(input);
  }
}