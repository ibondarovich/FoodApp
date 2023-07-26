import 'package:data/providers/local/local_provider.dart';
import 'package:domain/domain.dart';

class SettingsRepositoryImpl extends SettingsRepository{
  final LocalProvider _localProvider;

  SettingsRepositoryImpl({
    required LocalProvider localProvider
  }) : _localProvider = localProvider;
  
  @override
  Future<void> saveTheme(bool input) async {
    await _localProvider.saveTheme(input);
  }
  
  @override
  bool fetchTheme() {
    return _localProvider.getTheme();
  }
}