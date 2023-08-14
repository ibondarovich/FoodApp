import 'package:authentication/src/bloc/bloc/bloc.dart';
import 'package:authentication/src/ui/components/header.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'app_text_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<StatefulWidget> createState() => LogInState();
}

class LogInState extends State<LogInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (BuildContext context, AuthenticationState state) {
        if (state.isLoading) {
          return const AppLoaderWidget();
        } else {
          return CustomScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  padding: const EdgeInsets.all(
                    AppDimens.padding20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      const AuthHeader(
                        mainTitle: StringConstants.loginToAccount,
                        secondaryTitle: StringConstants.logInScreenText,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: AppDimens.padding12,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            StringConstants.emailAddress,
                          ),
                        ),
                      ),
                      AppTextField(
                        hintText: StringConstants.enterEmail,
                        controller: emailController,
                        margin: const EdgeInsets.only(
                          bottom: AppDimens.padding20,
                        ),
                        onChanged: (String value) => {
                          BlocProvider.of<AuthenticationBloc>(context)
                              .add(OnEmailChanged(value: value)),
                        },
                        errorText: state.emailValidationError.isEmpty
                            ? null
                            : state.emailValidationError,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: AppDimens.padding12,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            StringConstants.password,
                          ),
                        ),
                      ),
                      AppTextField(
                        hintText: StringConstants.enterPassword,
                        controller: passwordController,
                        obscureText: true,
                        onChanged: (String value) => {
                          BlocProvider.of<AuthenticationBloc>(context)
                              .add(OnPasswordChanged(value: value))
                        },
                        errorText: state.passwordValidationError.isEmpty
                            ? null
                            : state.passwordValidationError,
                      ),
                      AppImageButton(
                        onTap: () {
                          BlocProvider.of<AuthenticationBloc>(context).add(
                            OnSignInWithGoogleEvent(),
                          );
                        },
                        title: StringConstants.signInWithGoogleText,
                        textStyle: AppFonts.normal_14.copyWith(
                          color: AppColors.black,
                          decoration: TextDecoration.underline,
                        ),
                        color: AppColors.white,
                        image: const AppImage(
                          filePath: AppImages.googleImg,
                          scale: AppDimens.scale,
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 13,
                        margin: const EdgeInsets.only(
                          bottom: AppDimens.padding20,
                          right: AppDimens.padding45,
                          left: AppDimens.padding45,
                          top: AppDimens.padding45,
                        ),
                        padding: const EdgeInsets.all(AppDimens.padding20),
                      ),
                      AppButton(
                        onTap: () {
                          BlocProvider.of<AuthenticationBloc>(context).add(
                            OnSignInEvent(
                              email: emailController.value.text,
                              password: passwordController.value.text,
                            ),
                          );
                        },
                        title: StringConstants.loginToAccount,
                        textStyle: AppFonts.normal_14.copyWith(
                          color: AppColors.white,
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 13,
                        margin: const EdgeInsets.only(
                          bottom: AppDimens.padding40,
                          right: AppDimens.padding15,
                          left: AppDimens.padding15,
                        ),
                        padding: const EdgeInsets.all(AppDimens.padding20),
                      ),
                      AppTextButton(
                        onTap: () {
                          BlocProvider.of<AuthenticationBloc>(context).add(
                            OnNavigateToSignUpPageEvent(),
                          );
                        },
                        title: StringConstants.createAccount,
                        textStyle: AppFonts.bold_14.copyWith(
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 13,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
