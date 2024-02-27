import 'package:firebase_auth/firebase_auth.dart';
import 'package:teams/core/exceptions/auth_exception.dart';

class FirebaseAuthExceptionMapper {
  static AuthException map(FirebaseAuthException fbException) {
    switch (fbException.code) {
      case 'email-already-in-use':
        return const AuthException(type: AuthExceptionType.emailExists);
      case 'invalid-email':
        return const AuthException(type: AuthExceptionType.userNotFound);
      case 'operation-not-allowed':
        return const AuthException(type: AuthExceptionType.unknown);
      case 'user-disabled':
        return const AuthException(type: AuthExceptionType.userDisabled);
      case 'user-not-found':
        return const AuthException(type: AuthExceptionType.userNotFound);
      case 'weak-password':
        return const AuthException(type: AuthExceptionType.weakPassword);
      case 'wrong-password':
        return const AuthException(type: AuthExceptionType.wrongPassword);
      default:
        return const AuthException(type: AuthExceptionType.unknown);
    }
  }
}
