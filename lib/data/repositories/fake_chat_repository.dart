import 'dart:async';

import 'package:get_it/get_it.dart';
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
      name: userIds.length < 3 ? 'Chat$i' : 'GroupChat$i',
      createTime: DateTime(2022, 2, 1, 0, 0, 0, 0),
      updateTime: DateTime(2022, 2, 1, 0, 0, 0, i),
      isGroupChat: userIds.length > 2,
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
        sentTime: DateTime(2022, 2, i % 12 + 1, 13, (i * 30) % 60, 0, i),
      );
    }
  });
  return res;
}

Map<String, Chat> testChats = {
  ..._generateChatsBetweenUsers(
    ['nU7rIBOgJIQGcjVwleEedggSQEz1', 'GQR5MKaA1tN57YHZKJFhU98jXco1'],
    40,
  ),
  ..._generateChatsBetweenUsers(
    [
      'nU7rIBOgJIQGcjVwleEedggSQEz1',
      'GQR5MKaA1tN57YHZKJFhU98jXco1',
      'ORtAX6QeBrdCoHKF1bUeMjQWPIv1'
    ],
    40,
  ),
};
Map<String, Message> testMessages = _generateMessagesInChats(testChats, 100);

@Singleton(as: ChatRepository)
class FakeChatRepository implements ChatRepository, Disposable {
  FakeChatRepository() {
    _messageStreamController = StreamController<Message>.broadcast();
    _chatUpdatesStreamController =
        StreamController<ChatUpdateStreamItem>.broadcast();
    _queue = MessageUploadQueue(
      streamController: _messageStreamController,
      chatUpdateStreamController: _chatUpdatesStreamController,
    );
  }

  final Map<String, Chat> _chats = testChats;
  final Map<String, Message> _messages = testMessages;
  late final StreamController<Message> _messageStreamController;
  late final StreamController<ChatUpdateStreamItem>
      _chatUpdatesStreamController;
  late final MessageUploadQueue _queue;

  @override
  Stream<ChatUpdateStreamItem> get chatUpdatesStream =>
      _chatUpdatesStreamController.stream;

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
    required bool groupChats,
    DateTime? beforeDateTime,
    String? beforeId,
    int? limit,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final List<Chat> userChats =
        _chats.values.where((chat) => chat.userIds.contains(userId)).toList();
    if (userChats.isEmpty) {
      return [];
    }

    // Filter by group or direct message chats.
    userChats.retainWhere((element) => element.isGroupChat == groupChats);

    // Fliter by beforeDateTime
    if (beforeDateTime != null) {
      userChats.retainWhere(
          (element) => element.updateTime.isBefore(beforeDateTime));
    }

    // Filter by beforeId
    if (beforeId != null) {
      userChats.retainWhere((chat) =>
          chat.updateTime.isBefore(beforeDateTime!) ||
          (chat.id.compareTo(beforeId) < 0));
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
      // throw const ChatException(type: ChatExceptionType.chatNotFound);
      return [];
    }

    // Filter by beforeDateTime
    if (beforeDateTime != null) {
      chatMessages
          .retainWhere((element) => element.sentTime.isBefore(beforeDateTime));
    }

    // Filter by beforeId
    if (beforeId != null) {
      chatMessages.retainWhere((element) =>
          element.sentTime.isBefore(beforeDateTime!) ||
          element.id.compareTo(beforeId) < 0);
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
      uploadStatus: MessageUploadStatus.uploadInProgress,
    );

    // Schedule storing new message.
    _queue.scheduleMessageUpload(
        newMessage, const Duration(milliseconds: 500), _messages);
    return newMessage;
  }

  @override
  FutureOr onDispose() {
    _messageStreamController.close();
  }
}

class MessageUploadQueue {
  MessageUploadQueue({
    required this.streamController,
    required this.chatUpdateStreamController,
  });

  final StreamController<Message> streamController;
  final StreamController<ChatUpdateStreamItem> chatUpdateStreamController;

  Future<void> scheduleMessageUpload(
    Message toUpload,
    Duration duration,
    Map<String, Message> messageList,
  ) async {
    await Future.delayed(duration, () {
      streamController.add(toUpload);
      final update = ChatUpdateStreamItem(
        chatId: toUpload.chatId,
        updateType: ChatUpdateType.newMessageUploadSuccess,
        newMessageId: toUpload.id,
      );

      messageList[toUpload.id] = toUpload.copyWith(
        uploadStatus: MessageUploadStatus.success,
      );
      chatUpdateStreamController.add(update);
    });
  }

  Future<void> uploadMessageWithDelay(
      Map<String, Message> messages,
      Message toAdd,
      Duration duration,
      StreamController streamController) async {
    await Future.delayed(duration);
    messages[toAdd.id] = toAdd;
    streamController.add(toAdd);
  }
}
