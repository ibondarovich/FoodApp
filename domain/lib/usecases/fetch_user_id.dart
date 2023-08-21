import 'package:domain/domain.dart';

class FetchUserIdUseCase implements UseCase<NoParams, String> {
  final UserRepository _userRepository;

  FetchUserIdUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  String execute(NoParams input) {
    return _userRepository.fetchUserId();
  }
}
