import 'package:teams/core/exceptions/app_exception.dart';

class ChatException extends AppException {
  final ChatExceptionType type;

  const ChatException({required this.type}) : super(AppExceptionType.chat);

  @override
  String toString() {
    switch (type) {
      case ChatExceptionType.chatNotFound:
        return 'Chat not found';
      case ChatExceptionType.invalidRequest:
        return 'Invalid request';
      case ChatExceptionType.unauthenticated:
        return 'User not authenticated';
      case ChatExceptionType.unknown:
        return 'Unknown chat error';
      case ChatExceptionType.userNotFound:
        return 'User not found';
    }
  }
}

enum ChatExceptionType {
  chatNotFound,
  invalidRequest,
  unauthenticated,
  unknown,
  userNotFound,
}
