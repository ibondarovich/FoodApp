import 'package:data/providers/local/theme_data_provider.dart';
import 'package:domain/domain.dart';

class SettingsRepositoryImpl extends SettingsRepository{
  final ThemeDataProvider _localProvider;

  SettingsRepositoryImpl({
    required ThemeDataProvider localProvider
  }) : _localProvider = localProvider;
  
  @override
  Future<void> saveTheme(bool input) async {
    await _localProvider.saveTheme(input);
  }
  
  @override
  bool fetchTheme() {
    return _localProvider.fetchTheme();
  }
  
  @override
  double fetchScaleFactor() {
    return _localProvider.fetchScaleFactor();
  }
  
  @override
  Future<void> saveScaleFactor(double input) async {
    await _localProvider.saveScaleFactor(input);
  }
}