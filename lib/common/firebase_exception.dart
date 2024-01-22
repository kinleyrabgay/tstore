class TFirebaseException implements Exception {
  final String code;

  TFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown firebase error occured. Please try again.';
      default:
        return 'non';
    }
  }
}
