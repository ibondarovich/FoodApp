part of 'bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class OnSignInWithGoogleEvent extends AuthenticationEvent {}

class OnNavigateToSignUpPageEvent extends AuthenticationEvent {}

class OnNavigateToLogInPageEvent extends AuthenticationEvent {}

class OnSignUpEvent extends AuthenticationEvent {
  final String email;
  final String password;

  OnSignUpEvent({
    required this.email,
    required this.password,
  });
}

class OnSignInEvent extends AuthenticationEvent {
  final String email;
  final String password;

  OnSignInEvent({
    required this.email,
    required this.password,
  });
}

class OnPasswordChanged extends AuthenticationEvent {
  final String value;

  OnPasswordChanged({
    required this.value,
  });
}

class OnEmailChanged extends AuthenticationEvent {
  final String value;

  OnEmailChanged({
    required this.value,
  });
}
