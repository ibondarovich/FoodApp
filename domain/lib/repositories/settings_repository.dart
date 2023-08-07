abstract class SettingsRepository{
  Future<void> saveTheme(bool input);
  bool fetchTheme();
}