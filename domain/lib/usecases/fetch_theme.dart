import 'package:domain/domain.dart';

class FetchThemeUseCase extends UseCase<NoParams, bool>{
  final SettingsRepository _settingsRepository;

  FetchThemeUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  bool execute(NoParams input) {
    return _settingsRepository.fetchTheme();
  }
}