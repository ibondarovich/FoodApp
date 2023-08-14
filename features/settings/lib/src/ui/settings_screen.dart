import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          StringConstants.appBarTitle,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: AppDimens.elevetion0,
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => SettingsBloc(
          fetchThemeUseCase: appLocator.get<FetchThemeUseCase>(),
          saveThemeUseCase: appLocator.get<SaveThemeUseCase>(),
          fetchScaleFactorUseCase: appLocator.get<FetchScaleFactorUseCase>(),
          saveScaleFactorUseCase: appLocator.get<SaveScaleFactorUseCase>(), 
          signOutUseCase: appLocator.get<SignOutUseCase>(), 
          authService: appLocator.get<AuthService>(),
        ),
        child: BlocBuilder<SettingsBloc, SettingsState>(
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
                          BlocProvider.of<SettingsBloc>(context).add(
                            OnSwitchThemeEvent(isDark: value),
                          );
                          SettingsWidget.of(context).setTheme(value);
                        },
                        value: state.isDark,
                        activeColor: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  const Divider(
                    color: AppColors.shadowBlack,
                    thickness: AppDimens.thickness1,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: AppDimens.padding20,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        StringConstants.settingsScaleFactorTitle,
                        style: AppFonts.bold_21,
                      ),
                    ),
                  ),
                  Slider(
                    value: state.scaleFactor,
                    onChanged: (double value) {
                      BlocProvider.of<SettingsBloc>(context).add(
                        OnSetScaleFactor(scaleFactor: value),
                      );
                      SettingsWidget.of(context).setTextScale(value);
                    },
                    min: TextScaleType.small.value,
                    max: TextScaleType.large.value,
                    divisions: AppDimens.divisions2,
                    activeColor: AppColors.lightOrange,
                    inactiveColor: AppColors.primaryColor,
                  ),
                  const Divider(
                    color: AppColors.shadowBlack,
                    thickness: AppDimens.thickness1,
                  ),
                  AppButton(
                    margin: const EdgeInsets.only(
                      top: AppDimens.padding20,
                    ),
                    title: StringConstants.settingsContactUsTitle,
                    textStyle: AppFonts.bold_14.copyWith(
                      color: AppColors.white,
                    ),
                    onTap: () async {
                      BlocProvider.of<SettingsBloc>(context).add(
                        OnLaunchUrlEvent(
                          url: UrlConstants.contactUsUrl,
                        ),
                      );
                    },
                  ),
                  AppButton(
                    margin: const EdgeInsets.only(
                      top: AppDimens.padding20,
                    ),
                    title: StringConstants.signOutTitle,
                    textStyle: AppFonts.bold_14.copyWith(
                      color: AppColors.white,
                    ),
                    onTap: () async {
                      BlocProvider.of<SettingsBloc>(context).add(
                        OnSignOutEvent(),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
