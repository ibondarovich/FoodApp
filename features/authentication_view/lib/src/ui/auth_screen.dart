import 'package:authentication_view/src/bloc/bloc/bloc.dart';
import 'package:authentication_view/src/ui/components/login.dart';
import 'package:authentication_view/src/ui/components/signup.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class AuthScreen extends StatelessWidget{
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
          checkUserExistenceUseCase: appLocator.get<CheckUserExistenceUseCase>(),
        ),
        child: BlocConsumer<AuthenticationViewBloc, AuthenticationViewState>(
          listener: (BuildContext context, AuthenticationViewState state) => {
            if(state.authStatus.isNotEmpty){
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    duration: const Duration(seconds: 4),
                    backgroundColor: AppColors.transparent,
                    elevation: AppDimens.elevetion0,
                    content: Container(
                      padding: const EdgeInsets.all(AppDimens.padding20),
                      decoration: const BoxDecoration(
                        color: AppColors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppDimens.padding20),
                        ),
                      ),
                      child: Text(state.authStatus),
                    ),
                  ),
                ),
            }
          },
          builder: (BuildContext context, AuthenticationViewState state) {
            if(state.isLoginScreenShowing){
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
