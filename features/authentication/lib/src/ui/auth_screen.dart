import 'package:authentication/src/bloc/bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'components/login.dart';
import 'components/signup.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const AppImage(
          filePath: AppImages.logoImg,
          scale: 2,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: AppDimens.elevetion0,
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (BuildContext context) => AuthenticationBloc(
          createUserUseCase: appLocator.get<CreateUserUseCase>(),
          signInWithGooleUseCase: appLocator.get<SignInWithGooleUseCase>(),
          signInUseCase: appLocator.get<SignInUseCase>(),
          authService: appLocator.get<AuthService>(),
          saveUserUseCase: appLocator.get<SaveUserUseCase>(),
          appRouter: appLocator.get<AppRouter>(),
          checkUserExistenceUseCase:
              appLocator.get<CheckUserExistenceUseCase>(),
        ),
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (BuildContext context, AuthenticationState state) => {
            if (state.authStatus.isNotEmpty){
              showAppSnackBar(context: context, title: state.authStatus),
            }
          },
          builder: (BuildContext context, AuthenticationState state) {
            if (state.isLoginScreenShowing) {
              return const LogInScreen();
            } else {
              return const SignUpScreen();
            }
          },
        ),
      ),
    );
  }
}
