import 'package:domain/domain.dart';

class SaveThemeUseCase extends FutureUseCase<bool, void>{
  final SettingsRepository settingsRepository;

  SaveThemeUseCase({
    required this.settingsRepository,
  });

  @override
  Future<void> execute(bool input) {
    return settingsRepository.saveTheme(input);
  }
}