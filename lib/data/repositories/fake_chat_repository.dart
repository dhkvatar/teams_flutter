import 'package:teams/core/exceptions/chat_exception.dart';
import 'package:teams/domain/entities/chat.dart';
import 'package:teams/domain/entities/message.dart';
import 'package:teams/domain/repositories/chat_repository.dart';
import 'package:uuid/uuid.dart';

class FakeChatRepository implements ChatRepository {
  final Map<String, Chat> _chats = {};
  final Map<String, Message> _messages = {};

  @override
  Future<Chat> createChat(
      {required String senderId,
      required List<String> receiverIds,
      required bool isGroupChat,
      String? chatName}) async {
    final now = DateTime.now();
    final newChatId = const Uuid().v4();

    final newChat = Chat(
      id: newChatId,
      userIds: [senderId, ...receiverIds],
      name: chatName ?? 'Chat(${receiverIds.length + 1})',
      createTime: now,
      updateTime: now,
      isGroupChat: isGroupChat,
    );
    _chats[newChatId] = newChat;
    return newChat;
  }

  @override
  Future<List<Chat>?> getChats(
      {required String userId,
      DateTime? from,
      DateTime? to,
      int? limit}) async {
    final userChats =
        _chats.values.where((chat) => chat.userIds.contains(userId)).toList();
    if (userChats.isEmpty) {
      throw const ChatException(type: ChatExceptionType.userNotFound);
    }

    // Filter by from time
    if (from != null) {
      userChats.retainWhere((e) => e.updateTime.isAfter(from));
    }

    // Filter by to time
    if (to != null) {
      userChats.retainWhere((e) => e.updateTime.isBefore(to));
    }

    // Sort by updateTime and choose the latest ones upto limit.
    userChats.sort((a, b) => b.updateTime.compareTo(a.updateTime));
    if (limit != null && limit > 0) {
      userChats.removeRange(limit, userChats.length);
    }
    return userChats;
  }

  @override
  Future<List<Message>?> getMessages(
      {required String chatId, int? limit}) async {
    final chatMessages =
        _messages.values.where((message) => message.chatId == chatId).toList();
    if (chatMessages.isEmpty) {
      throw const ChatException(type: ChatExceptionType.chatNotFound);
    }

    // Sort by sentTime and choose the latest ones upto limit.
    chatMessages.sort((a, b) => b.sentTime.compareTo(a.sentTime));
    if (limit != null && limit > 0) {
      chatMessages.removeRange(limit, chatMessages.length);
    }
    return chatMessages;
  }

  @override
  Future<Message> sendMessage({
    required String senderId,
    required String chatId,
    required String message,
  }) async {
    // Verify Chat with chatId exists.
    if (!_chats.containsKey(chatId)) {
      throw const ChatException(type: ChatExceptionType.chatNotFound);
    }

    // Create new message.
    final newMessageId = const Uuid().v4();
    final now = DateTime.now();
    final newMessage = Message(
      id: newMessageId,
      senderId: senderId,
      chatId: chatId,
      message: message,
      sentTime: now,
    );

    // Store new message.
    _messages[newMessageId] = newMessage;

    return newMessage;
  }
}
