part of 'bloc.dart';

@immutable
abstract class SettingsViewEvent {}

class InitEvent extends SettingsViewEvent {}

class OnSwitchThemeEvent extends SettingsViewEvent {
  final bool isDark;
  
  OnSwitchThemeEvent({
    required this.isDark
  });
}

class OnSetScaleFactor extends SettingsViewEvent {
  final double scaleFactor;

  OnSetScaleFactor({
    required this.scaleFactor,
  }); 
}

class OnGetScaleFactor extends SettingsViewEvent {}

class OnLaunchUrlEvent extends SettingsViewEvent {
  final String url;

  OnLaunchUrlEvent({
    required this.url,
  });
}