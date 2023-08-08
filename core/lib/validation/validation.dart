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

bool isValidated(String emailValidationError, String passwordValidationError) {
  return emailValidationError.isEmpty && passwordValidationError.isEmpty;
}