import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/core/exceptions/chat_exception.dart';
import 'package:teams/core/usecases/usecase.dart';
import 'package:teams/domain/entities/message.dart';
import 'package:teams/domain/repositories/auth_repository.dart';
import 'package:teams/domain/repositories/chat_repository.dart';

part 'send_message.freezed.dart';

@injectable
class SendMessage implements UseCase<Message, SendMessageParams> {
  SendMessage({required this.authRepository, required this.chatRepository});

  final AuthRepository authRepository;
  final ChatRepository chatRepository;

  @override
  Future<Message> call(SendMessageParams params) async {
    if (!authRepository.isLoggedIn) {
      throw const ChatException(type: ChatExceptionType.unauthenticated);
    }
    return await chatRepository.sendMessage(
      senderId: authRepository.currentUser!.id,
      chatId: params.chatId,
      message: params.message,
    );
  }
}

@freezed
class SendMessageParams with _$SendMessageParams {
  const factory SendMessageParams({
    required String chatId,
    required String message,
  }) = _SendMessageParams;
}
