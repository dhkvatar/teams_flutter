import 'package:teams/core/exceptions/app_exception.dart';

class AuthException extends AppException {
  final AuthExceptionType type;

  const AuthException({required this.type}) : super(AppExceptionType.auth);

  @override
  String toString() {
    switch (type) {
      case AuthExceptionType.userNotFound:
        return 'User not found';
      case AuthExceptionType.unknown:
        return 'Unknown authentication error';
      case AuthExceptionType.wrongPassword:
        return 'Wrong password';
      case AuthExceptionType.alreadyLoggedIn:
        return 'Already logged-in';
      case AuthExceptionType.emailExists:
        return 'Email already exists';
    }
  }
}

enum AuthExceptionType {
  unknown,
  userNotFound,
  wrongPassword,
  alreadyLoggedIn,
  emailExists,
}
