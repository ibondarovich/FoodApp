abstract class ThemeDataProvider{
  Future<void> saveTheme(bool input);
  Future<void> saveScaleFactor(double input);
  double fetchScaleFactor();
  bool fetchTheme();
}