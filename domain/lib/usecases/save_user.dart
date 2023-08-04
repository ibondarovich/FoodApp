import 'package:domain/domain.dart';

class SaveUserUseCase extends FutureUseCase<String, void> {
  final UserRepository _userRepository;

  SaveUserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;
  
  @override
  Future<void> execute(String input) async {
    await _userRepository.saveUser(input);
  }
}
