import 'package:authentication_view/src/bloc/bloc/bloc.dart';
import 'package:authentication_view/src/ui/components/login.dart';
import 'package:authentication_view/src/ui/components/signup.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Image.asset(
          'assets/img/logo.png',
          scale: 2,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: AppDimens.elevetion0,
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (BuildContext context) => AuthenticationViewBloc(
          createUserUseCase: appLocator.get<CreateUserUseCase>(),
          signInWithGooleUseCase: appLocator.get<SignInWithGooleUseCase>(),
          signInUseCase: appLocator.get<SignInUseCase>(),
          authService: appLocator.get<AuthService>(),
          saveUserUseCase: appLocator.get<SaveUserUseCase>(),
          appRouter: appLocator.get<AppRouter>(),
          checkUserExistenceUseCase:
              appLocator.get<CheckUserExistenceUseCase>(),
        ),
        child: BlocConsumer<AuthenticationViewBloc, AuthenticationViewState>(
          listener: (BuildContext context, AuthenticationViewState state) => {
            if (state.authStatus.isNotEmpty){
              showAppSnackBar(context: context, title: state.authStatus),
            }
          },
          builder: (BuildContext context, AuthenticationViewState state) {
            if (state.isLoginScreenShowing) {
              return const LogInWidget();
            } else {
              return const SignUpWidget();
            }
          },
        ),
      ),
    );
  }
}
