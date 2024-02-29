import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/core/exceptions/chat_exception.dart';
import 'package:teams/core/usecases/usecase.dart';
import 'package:teams/domain/entities/message.dart';
import 'package:teams/domain/repositories/auth_repository.dart';
import 'package:teams/domain/repositories/chat_repository.dart';

part 'get_messages.freezed.dart';

@injectable
class GetMessages implements UseCase<List<Message>, GetMessagesParams> {
  GetMessages({required this.authRepository, required this.chatRepository});

  final AuthRepository authRepository;
  final ChatRepository chatRepository;

  @override
  FutureOr<List<Message>> call(GetMessagesParams params) async {
    if (!authRepository.isLoggedIn) {
      throw const ChatException(type: ChatExceptionType.unauthenticated);
    }
    final messages = await chatRepository.getMessages(
        chatId: params.chatId,
        beforeDateTime: params.beforeDateTime,
        beforeId: params.beforeId,
        limit: params.limit);
    return messages ?? [];
  }
}

@freezed
class GetMessagesParams with _$GetMessagesParams {
  const factory GetMessagesParams({
    required String chatId,
    DateTime? beforeDateTime,
    String? beforeId,
    int? limit,
  }) = _GetMessagesParams;
}
