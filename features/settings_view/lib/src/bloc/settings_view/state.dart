part of 'bloc.dart';

class SettingsViewState {
  final bool isDark;
  final double scaleFactor;
  
  SettingsViewState({
    required this.isDark,
    this.scaleFactor = 1,
  });

  SettingsViewState copyWith({
    bool? isDark,
    double? scaleFactor,
  }){
    return SettingsViewState(
      isDark: isDark ?? this.isDark,
      scaleFactor: scaleFactor ?? this.scaleFactor,
    );
  }
}