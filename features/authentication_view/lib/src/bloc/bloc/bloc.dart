import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:navigation/navigation.dart';

part 'event.dart';
part 'state.dart';

class AuthenticationViewBloc
    extends Bloc<AuthenticationViewEvent, AuthenticationViewState> {
  final CreateUserUseCase _createUserUseCase;
  final SignInWithGooleUseCase _signInWithGooleUseCase;
  final SignInUseCase _signInUseCase;
  final SaveUserUseCase _saveUserUseCase;
  final CheckUserExistenceUseCase _checkUserExistenceUseCase;
  final AuthService _authService;
  final AppRouter _appRouter;

  AuthenticationViewBloc({
    required CreateUserUseCase createUserUseCase,
    required SignInWithGooleUseCase signInWithGooleUseCase,
    required SignInUseCase signInUseCase,
    required AuthService authService,
    required SaveUserUseCase saveUserUseCase,
    required AppRouter appRouter,
    required CheckUserExistenceUseCase checkUserExistenceUseCase,
  })  : _createUserUseCase = createUserUseCase,
        _signInWithGooleUseCase = signInWithGooleUseCase,
        _signInUseCase = signInUseCase,
        _authService = authService,
        _saveUserUseCase = saveUserUseCase,
        _checkUserExistenceUseCase = checkUserExistenceUseCase,
        _appRouter = appRouter,
        super(
          AuthenticationViewState(
            isLoading: false,
            isLoginScreenShowing: true,
          ),
        ) {
    on<OnSignUpEvent>(_onSignUp);
    on<OnSignInWithGoogleEvent>(_onSignInWithGoogle);
    on<OnSignInEvent>(_onSignIn);
    on<OnNavigateToLogInPageEvent>(_onNavigateToLogInPage);
    on<OnNavigateToSignUpPageEvent>(_onNavigateToSignUpPage);
    on<OnPasswordChanged>(_onPasswordChanged);
    on<OnEmailChanged>(_onEmailChanged);
  }

  void _onNavigateToLogInPage(
    OnNavigateToLogInPageEvent event,
    Emitter<AuthenticationViewState> emit,
  ) {
    emit(state.copyWith(isLoginScreenShowing: true));
  }

  void _onNavigateToSignUpPage(
    OnNavigateToSignUpPageEvent event,
    Emitter<AuthenticationViewState> emit,
  ) {
    emit(state.copyWith(isLoginScreenShowing: false));
  }

  void _onSignUp(
    OnSignUpEvent event,
    Emitter<AuthenticationViewState> emit,
  ) async {
    if (isValidated()) {
      try {
        emit(state.copyWith(isLoading: true));
        final String result = await _createUserUseCase.execute(
          UserModel(
            email: event.email,
            password: event.password,
          ),
        );
        await _saveUserUseCase.execute(result);
        _authService.authenticated = _checkUserExistenceUseCase.execute(
          const NoParams(),
        );
        _appRouter.push(const HomeRoute());
      } on FirebaseAuthException catch (e) {
        emit(
          state.copyWith(
            isLoading: false,
            authStatus: e.toString(),
          ),
        );
      }
    }
  }

  void _onSignInWithGoogle(
    OnSignInWithGoogleEvent event,
    Emitter<AuthenticationViewState> emit,
  ) async {
    try {
      final String result = await _signInWithGooleUseCase.execute(
        const NoParams(),
      );
      emit(state.copyWith(isLoading: true));
      await _saveUserUseCase.execute(result);
      _authService.authenticated = _checkUserExistenceUseCase.execute(
        const NoParams(),
      );
      _appRouter.push(const HomeRoute());
    } on FirebaseAuthException catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          authStatus: e.toString(),
        ),
      );
    }
  }

  void _onSignIn(
    OnSignInEvent event,
    Emitter<AuthenticationViewState> emit,
  ) async {
    if (isValidated()) {
      try {
        emit(state.copyWith(isLoading: true));
        final String result = await _signInUseCase.execute(
          UserModel(
            email: event.email,
            password: event.password,
          ),
        );
        await _saveUserUseCase.execute(result);
        _authService.authenticated = _checkUserExistenceUseCase.execute(
          const NoParams(),
        );
        _appRouter.push(const HomeRoute());
      } on FirebaseAuthException catch (e) {
        emit(
          state.copyWith(
            isLoading: false,
            authStatus: e.toString(),
          ),
        );
      }
    }
  }

  void _onPasswordChanged(
    OnPasswordChanged event,
    Emitter<AuthenticationViewState> emit,
  ) {
    final String? validationResult = passwordValidation(event.value);
    if (validationResult != null) {
      emit(
        state.copyWith(
          passwordValidationError: validationResult,
          authStatus: '',
        ),
      );
    } else {
      emit(
        state.copyWith(
          passwordValidationError: '',
          authStatus: '',
        ),
      );
    }
  }

  void _onEmailChanged(
    OnEmailChanged event,
    Emitter<AuthenticationViewState> emit,
  ) {
    final String? validationResult = emailValidation(event.value);
    if (validationResult != null) {
      emit(
        state.copyWith(
          emailValidationError: validationResult,
          authStatus: '',
        ),
      );
    } else {
      emit(
        state.copyWith(
          emailValidationError: '',
          authStatus: '',
        ),
      );
    }
  }

  String? emailValidation(String email) {
    if (email.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? passwordValidation(String password) {
    if (password.isEmpty) {
      return 'Please enter a password';
    }
    if (password.length < 6) {
      return 'Too short password';
    }
    return null;
  }

  bool isValidated() {
    return state.emailValidationError.isEmpty &&
        state.passwordValidationError.isEmpty;
  }
}
