part of 'bloc.dart';

class AuthenticationViewState {
  final bool isLoading;
  final bool isLoginScreenShowing;
  final String passwordValidationError;
  final String emailValidationError;
  final String authStatus;

  AuthenticationViewState({
    required this.isLoading,
    required this.isLoginScreenShowing,
    this.authStatus = '',
    this.passwordValidationError = '',
    this.emailValidationError = '',
  });

  AuthenticationViewState copyWith({
    bool? isLoading,
    bool? isLoginScreenShowing,
    String? authStatus,
    String? passwordValidationError,
    String? emailValidationError,
  }) {
    return AuthenticationViewState(
      isLoading: isLoading ?? this.isLoading,
      isLoginScreenShowing: isLoginScreenShowing ?? this.isLoginScreenShowing,
      emailValidationError: emailValidationError ?? this.emailValidationError,
      passwordValidationError:
          passwordValidationError ?? this.passwordValidationError,
      authStatus: authStatus ?? this.authStatus,
    );
  }
}
