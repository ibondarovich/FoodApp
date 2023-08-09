import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import '../bloc/bloc.dart';

class MainViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => MainViewBloc(
        authService: appLocator.get<AuthService>(),
        appRouter: appLocator.get<AppRouter>(),
        getUserUseCase: appLocator.get<CheckUserExistenceUseCase>(),
        fetchThemeUseCase: appLocator.get<FetchThemeUseCase>(),
        fetchScaleFactorUseCase: appLocator.get<FetchScaleFactorUseCase>(),
      ),
      child: BlocConsumer<MainViewBloc, MainState>(
        builder: (context, state) {
          return const AutoRouter();
        },
        listener: (context, state) {
          SettingsWidget.of(context).setTheme(state.isDark);
          SettingsWidget.of(context).setTextScale(state.textScale);
        },
      ),
    );
  }
}
