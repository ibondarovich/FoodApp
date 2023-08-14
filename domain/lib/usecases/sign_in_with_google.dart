import 'package:domain/domain.dart';

class SignInWithGooleUseCase extends FutureUseCase<NoParams, String> {
  final UserRepository _userRepository;

  SignInWithGooleUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<String> execute(NoParams input) async {
    return await _userRepository.signInWithGoogle();
  }
}
