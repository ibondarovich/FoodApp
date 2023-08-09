import 'package:core/core.dart';
import 'package:data/providers/local/theme_data_provider.dart';
import 'package:hive/hive.dart';

class ThemeDataProviderImpl implements ThemeDataProvider{
  final Box<bool> settingsHiveBox;
  final Box<double> scaleFactorHiveBox;

  ThemeDataProviderImpl({
    required this.settingsHiveBox,
    required this.scaleFactorHiveBox,
  });

  @override
  Future<void> saveTheme(bool input) async {
    await settingsHiveBox.put(StringConstants.hiveBoxThemeName, input);
  }

  @override
  bool fetchTheme() {
    return settingsHiveBox.get(StringConstants.hiveBoxThemeName) ?? false;
  }

  @override
  double fetchScaleFactor() {
    return scaleFactorHiveBox.get(StringConstants.hiveBoxScaleFactorName) ??
        TextScaleType.small.value;
  }

  @override
  Future<void> saveScaleFactor(double input) async {
    await scaleFactorHiveBox.put(StringConstants.hiveBoxScaleFactorName, input);
  }
}