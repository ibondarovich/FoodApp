import 'package:flutter/material.dart';

class SettingsWidget extends InheritedWidget {
  final void Function(bool) setTheme;
  final Function(double) setTextScale;

  const SettingsWidget({
    Key? key,
    required Widget child,
    required this.setTheme,
    required this.setTextScale,
  }) : super(key: key, child: child);

  static SettingsWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SettingsWidget>()!;
  }

  @override
  bool updateShouldNotify(SettingsWidget oldWidget) {
    return true;
  }
}
