import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/core/exceptions/chat_exception.dart';
import 'package:teams/core/usecases/usecase.dart';
import 'package:teams/domain/entities/chat.dart';
import 'package:teams/domain/repositories/auth_repository.dart';
import 'package:teams/domain/repositories/chat_repository.dart';

part 'get_chats.freezed.dart';

/// The [GetChats] class is a use case that retrieves a list of [Chat] objects.
@injectable
class GetChats implements UseCase<List<Chat>, GetChatsParams> {
  GetChats({required this.authRepository, required this.chatRepository});

  final AuthRepository authRepository;
  final ChatRepository chatRepository;

  /// Checks if the user is logged in and retrieves the current user's Id.
  /// It queries the [ChatRepository] to get [Chat] objects within the given
  /// constraints.
  ///
  /// Throws [ChatException] on failure.
  @override
  Future<List<Chat>> call(GetChatsParams params) async {
    if (!authRepository.isLoggedIn) {
      throw const ChatException(type: ChatExceptionType.unauthenticated);
    }
    final user = authRepository.currentUser!;
    final chats = await chatRepository.getChats(
      userId: user.id,
      groupChats: params.groupChats,
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
    required bool groupChats,
    DateTime? beforeDateTime,
    String? beforeId,
    int? limit,
  }) = _GetChatsParams;
}
