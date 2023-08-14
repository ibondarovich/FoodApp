import 'package:core/constants/string_constants.dart';

String? emailValidation(String email) {
  if (email.isEmpty) {
    return StringConstants.enterEmailValidation;
  }
  if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(email)) {
    return StringConstants.enterValidEmailValidation;
  }
  return null;
}

String? passwordValidation(String password) {
  if (password.isEmpty) {
    return StringConstants.enterPassword;
  }
  if (password.length < 6) {
    return StringConstants.shortPasswordValidation;
  }
  return null;
}

bool isValidated(String emailValidationError, String passwordValidationError) {
  return emailValidationError.isEmpty && passwordValidationError.isEmpty;
}
