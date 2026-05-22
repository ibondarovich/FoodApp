import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final CreateUserUseCase _createUserUseCase;
  final SignInWithGooleUseCase _signInWithGooleUseCase;
  final SignInUseCase _signInUseCase;
  final SaveUserUseCase _saveUserUseCase;
  final CheckUserExistenceUseCase _checkUserExistenceUseCase;
  final AuthService _authService;
  final AppRouter _appRouter;

  AuthenticationBloc({
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
          AuthenticationState(
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
    Emitter<AuthenticationState> emit,
  ) {
    emit(state.copyWith(isLoginScreenShowing: true));
  }

  void _onNavigateToSignUpPage(
    OnNavigateToSignUpPageEvent event,
    Emitter<AuthenticationState> emit,
  ) {
    emit(state.copyWith(isLoginScreenShowing: false));
  }

  void _onSignUp(
    OnSignUpEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    final bool result = isValidated(
      state.emailValidationError,
      state.passwordValidationError,
    );
    if (result) {
      try {
        emit(state.copyWith(isLoading: true, authStatus: ''));
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
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      final String result = await _signInWithGooleUseCase.execute(
        const NoParams(),
      );
      emit(state.copyWith(isLoading: true, authStatus: ''));
      await _saveUserUseCase.execute(result);
      _authService.authenticated = _checkUserExistenceUseCase.execute(
        const NoParams(),
      );
      _appRouter.replace(const HomeRoute());
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
    Emitter<AuthenticationState> emit,
  ) async {
    final bool result = isValidated(
      state.emailValidationError,
      state.passwordValidationError,
    );
    if (result) {
      try {
        emit(state.copyWith(isLoading: true, authStatus: ''));
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
        _appRouter.replace(const HomeRoute());
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
    Emitter<AuthenticationState> emit,
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
    Emitter<AuthenticationState> emit,
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
}
