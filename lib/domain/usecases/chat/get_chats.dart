import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/core/exceptions/chat_exception.dart';
import 'package:teams/core/usecases/usecase.dart';
import 'package:teams/domain/entities/chat.dart';
import 'package:teams/domain/repositories/auth_repository.dart';
import 'package:teams/domain/repositories/chat_repository.dart';

part 'get_chats.freezed.dart';

@injectable
class GetChats implements UseCase<List<Chat>, GetChatsParams> {
  GetChats({required this.authRepository, required this.chatRepository});

  final AuthRepository authRepository;
  final ChatRepository chatRepository;

  @override
  Future<List<Chat>> call(GetChatsParams params) async {
    if (!authRepository.isLoggedIn) {
      throw const ChatException(type: ChatExceptionType.unauthenticated);
    }
    final user = authRepository.currentUser!;
    final chats = await chatRepository.getChats(
      userId: user.id,
      beforeDateTime: params.beforeDateTime,
      beforeId: params.beforeId,
      limit: params.limit,
    );
    return chats ?? [];
  }
}

@freezed
class GetChatsParams with _$GetChatsParams {
  const factory GetChatsParams({
    DateTime? beforeDateTime,
    String? beforeId,
    int? limit,
  }) = _GetChatsParams;
}
