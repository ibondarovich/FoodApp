import 'package:domain/domain.dart';

class CheckUserExistenceUseCase extends UseCase<NoParams, bool> {
  final UserRepository _userRepository;

  CheckUserExistenceUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  bool execute(NoParams input) {
    return _userRepository.isUserExists();
  }
}
