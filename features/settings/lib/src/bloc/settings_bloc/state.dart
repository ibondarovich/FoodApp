part of 'bloc.dart';

class SettingsState {
  final bool isDark;
  final double scaleFactor;
  
  SettingsState({
    required this.isDark,
    required this.scaleFactor,
  });

  SettingsState copyWith({
    bool? isDark,
    double? scaleFactor,
  }){
    return SettingsState(
      isDark: isDark ?? this.isDark,
      scaleFactor: scaleFactor ?? this.scaleFactor,
    );
  }
}