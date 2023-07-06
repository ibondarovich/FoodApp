part of 'bloc.dart';

@immutable
abstract class SettingsViewEvent {}

class ThemeSwitchEvent extends SettingsViewEvent{
  final bool isDark;
  
  ThemeSwitchEvent({
    required this.isDark
  });
}