import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings_view/src/bloc/settings_view/bloc.dart';

class SettingsViewScreen extends StatelessWidget{
  const SettingsViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar (
        title: Text(
          StringConstants.appBarTitle,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: AppDimens.elevetion0,
        centerTitle: true,
      ),
      body: BlocBuilder<SettingsViewBloc, SettingsViewState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(AppDimens.padding20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    const Text(
                      StringConstants.settingsThemeTitle,
                      style: AppFonts.bold_21,
                    ),
                    Switch(
                      onChanged: (bool value) { 
                        BlocProvider.of<SettingsViewBloc>(context).add(
                          OnSwitchThemeEvent(isDark: value),
                        );
                      }, 
                      value: state.isDark,
                      activeColor: AppColors.primaryColor,
                    ),
                  ],
                )
              ],
            ),
          );
        },
      )
    );
  }
}