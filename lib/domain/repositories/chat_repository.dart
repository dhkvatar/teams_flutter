import 'package:teams/domain/entities/chat.dart';
import 'package:teams/domain/entities/message.dart';

/// Chat repository API.
abstract class ChatRepository {
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
      DateTime? beforeDateTime,
      String? beforeId,
      int? limit});

  /// Get messages for a chat.
  Future<List<Message>?> getMessages({required String chatId, int? limit});
}
