import 'package:authentication_view/src/bloc/bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'app_text_field.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<StatefulWidget> createState() => SignUpState();
}

class SignUpState extends State<SignUpWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationViewBloc, AuthenticationViewState>(
      builder: (BuildContext context, AuthenticationViewState state) {
        if (state.isLoading) {
          return const AppLoaderWidget();
        } else {
          return Form(
            key: formKey,
            child: SingleChildScrollView(
              reverse: true,
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                padding: const EdgeInsets.all(
                  AppDimens.padding20,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                        left: AppDimens.padding12,
                        bottom: AppDimens.padding20,
                        top: AppDimens.padding35,
                      ),
                      child: const Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: AppDimens.padding20,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                StringConstants.createAccount,
                                textAlign: TextAlign.left,
                                style: AppFonts.bold_25,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              StringConstants.signUpScreen,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: AppDimens.padding35,
                      ),
                      child: Column(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(
                              left: AppDimens.padding12,
                              bottom: AppDimens.padding10,
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
                              BlocProvider.of<AuthenticationViewBloc>(context)
                                  .add(
                                OnEmailChanged(value: value),
                              ),
                            },
                            errorText: state.emailValidationError.isEmpty
                                ? null
                                : state.emailValidationError,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: AppDimens.padding12,
                              bottom: AppDimens.padding10,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                StringConstants.password,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          AppTextField(
                            hintText: StringConstants.enterPassword,
                            controller: passwordController,
                            obscureText: true,
                            margin: const EdgeInsets.only(
                              bottom: AppDimens.padding50,
                            ),
                            onChanged: (String value) => {
                              BlocProvider.of<AuthenticationViewBloc>(context)
                                  .add(
                                OnPasswordChanged(value: value),
                              ),
                            },
                            errorText: state.passwordValidationError.isEmpty
                                ? null
                                : state.passwordValidationError,
                          ),
                        ],
                      ),
                    ),
                    AppImageButton(
                      onTap: () {
                        BlocProvider.of<AuthenticationViewBloc>(context).add(
                          OnSignInWithGoogleEvent(),
                        );
                      },
                      title: StringConstants.signInWithGoogleText,
                      textStyle: AppFonts.normal_14.copyWith(
                        color: AppColors.black,
                        decoration: TextDecoration.underline,
                      ),
                      color: AppColors.white,
                      image: Image.asset(
                        'assets/img/google.png',
                        scale: 0.5,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 13,
                      margin: const EdgeInsets.only(
                        bottom: AppDimens.padding20,
                        right: AppDimens.padding45,
                        left: AppDimens.padding45,
                        top: AppDimens.margin90,
                      ),
                      padding: const EdgeInsets.all(AppDimens.padding20),
                    ),
                    AppButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthenticationViewBloc>(context).add(
                            OnSignUpEvent(
                              email: emailController.value.text,
                              password: passwordController.value.text,
                            ),
                          );
                        }
                      },
                      title: StringConstants.createAccount,
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
                        BlocProvider.of<AuthenticationViewBloc>(context).add(
                          OnNavigateToLogInPageEvent(),
                        );
                      },
                      title: StringConstants.loginToAccount,
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
