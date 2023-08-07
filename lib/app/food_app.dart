import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:settings_view/settings_view.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsViewBloc(
        fetchThemeUseCase: appLocator.get<FetchThemeUseCase>(), 
        saveThemeUseCase: appLocator.get<SaveThemeUseCase>(),
      ),
      child: BlocBuilder<SettingsViewBloc, SettingsViewState>(
        builder: (BuildContext context, SettingsViewState state) {
          return MaterialApp.router(
            routerDelegate: appLocator.get<AppRouter>().delegate(),
            routeInformationParser:
                appLocator.get<AppRouter>().defaultRouteParser(),
            theme: state.isDark? AppTheme.dark : AppTheme.light,
          );
        },
      ),
    );
  }
}