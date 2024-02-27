import 'package:teams/core/exceptions/app_exception.dart';

class AuthException extends AppException {
  final AuthExceptionType type;

  const AuthException({required this.type}) : super(AppExceptionType.auth);

  @override
  String toString() {
    switch (type) {
      case AuthExceptionType.alreadyLoggedIn:
        return 'Already logged-in';
      case AuthExceptionType.emailExists:
        return 'Email already exists';
      case AuthExceptionType.notAllowed:
        return 'Request is not allowed';
      case AuthExceptionType.unknown:
        return 'Unknown authentication error';
      case AuthExceptionType.userDisabled:
        return 'User account disabled';
      case AuthExceptionType.userNotFound:
        return 'User not found';
      case AuthExceptionType.weakPassword:
        return 'Weak password';
      case AuthExceptionType.wrongPassword:
        return 'Wrong password';
    }
  }
}

enum AuthExceptionType {
  unknown,
  alreadyLoggedIn,
  emailExists,
  notAllowed,
  userDisabled,
  userNotFound,
  weakPassword,
  wrongPassword,
}
