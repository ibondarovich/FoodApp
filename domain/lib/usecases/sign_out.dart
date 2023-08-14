import 'package:domain/domain.dart';

class SignOutUseCase extends FutureUseCase<NoParams, void> {
  final UserRepository _userRepository;

  SignOutUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<void> execute(NoParams input) async {
    _userRepository.signOut();
  }
}
