import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teams/domain/entities/chat.dart';
import 'package:teams/domain/entities/message.dart';

part 'chat_repository.freezed.dart';

/// Chat repository API.
abstract class ChatRepository {
  /// Stream of messages uploaded to the server.
  Stream<ChatUpdateStreamItem> get chatUpdatesStream;

  /// Create a chat.
  Future<Chat> createChat(
      {required String senderId,
      required List<String> receiverIds,
      required bool isGroupChat,
      String? chatName});

  /// Send a message to a chat.
  Future<Message> sendMessage({
    required String senderId,
    required String chatId,
    required String message,
  });

  /// Get chats that a user is part of.
  Future<List<Chat>?> getChats(
      {required String userId,
      required bool groupChats,
      DateTime? beforeDateTime,
      String? beforeId,
      int? limit});

  /// Get messages for a chat.
  Future<List<Message>?> getMessages(
      {required String chatId,
      DateTime? beforeDateTime,
      String? beforeId,
      int? limit});
}

@freezed
class ChatUpdateStreamItem with _$ChatUpdateStreamItem {
  const factory ChatUpdateStreamItem({
    // The Id of the Chat  the update is on.
    required String chatId,

    // The update type.
    required ChatUpdateType updateType,

    // The Id of the new message.
    // Applies to newMessageUploadSuccess and newMessageUploadFailure types.
    String? newMessageId,
  }) = _ChatUpdateStreamItem;
}

enum ChatUpdateType {
  newMessageUploadSuccess,
  newMessageUploadFailure,
}
