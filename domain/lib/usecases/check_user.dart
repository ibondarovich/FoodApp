import 'package:domain/domain.dart';

class CheckUserUseCase extends UseCase<NoParams, bool> {
  final UserRepository _userRepository;

  CheckUserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  bool execute(NoParams input) {
    return _userRepository.checkUser();
  }
}
