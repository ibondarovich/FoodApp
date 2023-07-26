import 'package:domain/domain.dart';

class SaveScaleFactorUseCase extends FutureUseCase<double, void> {
  final SettingsRepository _settingsRepository;

  SaveScaleFactorUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  Future<void> execute(double input) async {
    return _settingsRepository.saveScaleFactor(input);
  }
}