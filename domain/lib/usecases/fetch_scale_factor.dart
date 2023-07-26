import 'package:domain/domain.dart';

class FetchScaleFactorUseCase extends UseCase<NoParams, double> {
  final SettingsRepository _settingsRepository;

  FetchScaleFactorUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  double execute(NoParams input) {
    return _settingsRepository.fetchScaleFactor();
  }
}