part of 'bloc.dart';

@immutable
abstract class SettingsEvent {}

class InitEvent extends SettingsEvent {}

class OnSwitchThemeEvent extends SettingsEvent {
  final bool isDark;
  
  OnSwitchThemeEvent({
    required this.isDark
  });
}

class OnSetScaleFactor extends SettingsEvent {
  final double scaleFactor;

  OnSetScaleFactor({
    required this.scaleFactor,
  }); 
}

class OnGetScaleFactor extends SettingsEvent {}

class OnLaunchUrlEvent extends SettingsEvent {
  final String url;

  OnLaunchUrlEvent({
    required this.url,
  });
}

class OnSignOutEvent extends SettingsEvent {}
