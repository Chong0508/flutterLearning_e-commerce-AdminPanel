/// Custom exception class to handle various Firebase-related errors.
class TFirebaseException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes an error code.
  TFirebaseException(this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown error occurred. Please try again.';
      case 'invalid-custom-token':
        return 'The provided custom token is invalid. Please check the token and try again.';
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience.';
      case 'user-disabled':
        return 'The user account has been disabled';
      case 'user-not-found':
        return 'No user found for the given email or UID.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email';
      case 'email-already-in-use':
        return 'The email address provided is already registered. Please use a different email.';
      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password';
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Contact support for assistance.';
      case 'invalid-credential':
        return 'The supplied credential is malformed or has expired.';
      case 'invalid-verification-code':
        return 'The verification code is invalid. Please check the code and try again.';
      case 'invalid-verification-id':
        return 'Invlaid verification ID. Please request a new verification code.';
      case 'captcha-check-failed':
        return 'The reCAPTCHA response is invalid. Please try again.';
      case 'app-not-authorized':
        return 'The app is not authorized to use Firebase Authentication with the provided API key.';
      case 'keychain-error':
        return 'A keychain error occurred. Please check the keychain and try again.';      
      case 'network-request-failed':
        return 'Network request failed. Please check your internet connection.';
      case 'too-many-requests':
        return 'Too many requests have been made. Please try again later.';
      case 'internal-error':
        return 'An internal error occurred. Please try again later.';
      case 'user-token-expired':
        return 'The user token has expired. Please sign in again.';
      case 'credential-already-in-use':
        return 'The credential is already in use. Please use a different credential.';
      default:
        return 'An unexpected Firebase error occurred. Please try again later.';
    }
  }
}