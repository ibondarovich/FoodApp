import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class FoodApp extends StatefulWidget {
  const FoodApp({super.key});

  @override
  State<StatefulWidget> createState() => FoodAppState();
}

class FoodAppState extends State<FoodApp> {
  bool _isDark = false;
  double _scaleFactor = TextScaleType.small.value;

  void _setTheme(bool value) {
    setState(() {
      _isDark = value;
    });
  }

  void _setScaleFactor(double value) {
    setState(() {
      _scaleFactor = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SettingsWidget(
      setTheme: _setTheme,
      setTextScale: _setScaleFactor,
      child: MaterialApp.router(
        routerDelegate: appLocator.get<AppRouter>().delegate(),
        routeInformationParser:
            appLocator.get<AppRouter>().defaultRouteParser(),
        theme: _isDark ? AppTheme.dark : AppTheme.light,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: _scaleFactor,
            ),
            child: child!,
          );
        },
      ),
    );
  }
}
