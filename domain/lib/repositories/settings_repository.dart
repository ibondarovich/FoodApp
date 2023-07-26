abstract class SettingsRepository{
  Future<void> saveTheme(bool input);
  Future<void> saveScaleFactor(double input);
  bool fetchTheme();
  double fetchScaleFactor();
}