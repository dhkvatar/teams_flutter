import 'package:injectable/injectable.dart';
import 'package:teams/core/exceptions/chat_exception.dart';
import 'package:teams/domain/entities/chat.dart';
import 'package:teams/domain/entities/message.dart';
import 'package:teams/domain/repositories/chat_repository.dart';
import 'package:uuid/uuid.dart';

Map<String, Chat> _generateChatsBetweenUsers(
  List<String> userIds,
  int n,
) {
  final res = <String, Chat>{};
  for (int i = 0; i < n; i++) {
    final id = userIds.length < 3 ? 'chat_$i' : 'group_chat_$i';
    res[id] = Chat(
      id: id,
      userIds: userIds,
      name: 'Chat$i',
      createTime: DateTime(2022, 2, 1, 0, 0, 0, 0),
      updateTime: DateTime(2022, 2, 1, 0, 0, 0, i),
      isGroupChat: false,
    );
  }
  return res;
}

Map<String, Message> _generateMessagesInChats(
  Map<String, Chat> chats,
  int n,
) {
  final res = <String, Message>{};
  chats.forEach((chatId, chat) {
    for (int i = 0; i < n; i++) {
      final messageId = '${chatId}_message_$i';
      res[messageId] = Message(
        id: messageId,
        senderId: i % 2 == 0 ? chat.userIds[0] : chat.userIds[1],
        chatId: chatId,
        message: 'message_$i',
        sentTime: DateTime(2022, 2, 1, 13, 0, 0, i),
      );
    }
  });
  return res;
}

Map<String, Chat> testChats = _generateChatsBetweenUsers(
  ['nU7rIBOgJIQGcjVwleEedggSQEz1', 'GQR5MKaA1tN57YHZKJFhU98jXco1'],
  100,
);
Map<String, Message> testMessages = _generateMessagesInChats(testChats, 100);

@Injectable(as: ChatRepository)
class FakeChatRepository implements ChatRepository {
  final Map<String, Chat> _chats = testChats;
  final Map<String, Message> _messages = testMessages;

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
  Future<List<Chat>?> getChats({
    required String userId,
    DateTime? beforeDateTime,
    String? beforeId,
    int? limit,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final List<Chat> userChats =
        _chats.values.where((chat) => chat.userIds.contains(userId)).toList();
    if (userChats.isEmpty) {
      throw const ChatException(type: ChatExceptionType.userNotFound);
    }

    // Fliter by beforeDateTime
    if (beforeDateTime != null) {
      userChats.retainWhere(
          (element) => element.updateTime.isBefore(beforeDateTime));
    }

    // Filter by beforeId
    if (beforeId != null) {
      userChats.retainWhere((element) => element.id.compareTo(beforeId) < 0);
    }
    // Sort by updateTime and choose the latest ones upto limit.
    userChats.sort((a, b) => b.updateTime.compareTo(a.updateTime));
    if (limit != null && limit > 0 && userChats.length > limit) {
      userChats.removeRange(limit, userChats.length);
    }
    return userChats;
  }

  @override
  Future<List<Message>?> getMessages(
      {required String chatId,
      DateTime? beforeDateTime,
      String? beforeId,
      int? limit}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final chatMessages =
        _messages.values.where((message) => message.chatId == chatId).toList();
    if (chatMessages.isEmpty) {
      throw const ChatException(type: ChatExceptionType.chatNotFound);
    }

    // Filter by beforeDateTime
    if (beforeDateTime != null) {
      chatMessages
          .retainWhere((element) => element.sentTime.isBefore(beforeDateTime));
    }

    // Filter by beforeId
    if (beforeId != null) {
      chatMessages.retainWhere((element) => element.id.compareTo(beforeId) < 0);
    }

    // Sort by sentTime and choose the latest ones upto limit.
    chatMessages.sort((a, b) => b.sentTime.compareTo(a.sentTime));
    if (limit != null && limit > 0 && chatMessages.length > limit) {
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
