class TFirebaseAuthException implements Exception {
  final String code;

  TFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already registered. Please use different email.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter valid email.';
      case 'weak-password':
        return 'The password is too weak. Please choose stronger password.';
      case 'user-not-found':
        return 'Invalid login details. User not found.';
      case 'invalid-verfication-code':
        return 'invalid verfication code. Please enter valid code.';
      case 'quote-exceeded':
        return 'Quota exceeded. Please try again later';
      case 'email-already-exist':
        return 'Email already exist. Pleast use a different email';
      case 'provider-already-linked':
        return 'Email already exist. Pleast use a different email';
      default:
        return 'Non';
    }
  }
}
