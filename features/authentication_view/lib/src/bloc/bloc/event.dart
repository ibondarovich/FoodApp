part of 'bloc.dart';

@immutable
abstract class AuthenticationViewEvent {}

class OnSignInWithGoogleEvent extends AuthenticationViewEvent {}

class OnNavigateToSignUpPageEvent extends AuthenticationViewEvent {}

class OnNavigateToLogInPageEvent extends AuthenticationViewEvent {}

class OnSignUpEvent extends AuthenticationViewEvent {
  final String email;
  final String password;

  OnSignUpEvent({
    required this.email,
    required this.password,
  });
}

class OnSignInEvent extends AuthenticationViewEvent {
  final String email;
  final String password;

  OnSignInEvent({
    required this.email,
    required this.password,
  });
}

class OnPasswordChanged extends AuthenticationViewEvent {
  final String value;

  OnPasswordChanged({
    required this.value,
  });
}

class OnEmailChanged extends AuthenticationViewEvent {
  final String value;

  OnEmailChanged({
    required this.value,
  });
}
