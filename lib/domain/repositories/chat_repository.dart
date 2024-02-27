import 'package:teams/domain/entities/chat.dart';
import 'package:teams/domain/entities/message.dart';

/// Chat repository API.
abstract class ChatRepository {
  /// Send a message to a chat.
  Future<Message> sendMessage(Message message);

  /// Get chats that a user is part of.
  Future<List<Chat>?> getChats(
      {String userId, DateTime? from, DateTime? to, int? limit});

  /// Get messages for a chat.
  Future<List<Chat>?> getMessages({required String chatId, int? limit});
}
