part of 'bloc.dart';

@immutable
abstract class SettingsViewEvent {}

class OnSwitchThemeEvent extends SettingsViewEvent{
  final bool isDark;
  
  OnSwitchThemeEvent({
    required this.isDark
  });
}