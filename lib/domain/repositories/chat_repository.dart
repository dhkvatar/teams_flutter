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

  /// Get either the direct chats or the group chats that a user is part of.
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

/// The items yielded by a stream with updates on existing messages from the
/// backend.
/// For example, a message requested to be uploaded to the server with the
/// uploadStatus set to uploadInProgress may be acked by the server after the
/// updload, in which case the message held by the UI can be updated to have
/// uploadStatus set to success.
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
  // Notifies that a new message requested to be uploaded has been successfully
  // uploaded to the backend.
  newMessageUploadSuccess,

  // Notifies that a new message requested to be uploaded has failed to
  // upload to the backend.
  newMessageUploadFailure,
}
