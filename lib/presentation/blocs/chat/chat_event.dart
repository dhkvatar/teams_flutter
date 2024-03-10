import 'package:teams/domain/repositories/chat_repository.dart';

sealed class ChatEvent {
  const ChatEvent();
}

// Request for chats.
final class ChatGetChatsRequested extends ChatEvent {
  const ChatGetChatsRequested({
    required this.groupChats,
    this.beforeDateTime,
    this.beforeChatId,
    this.limit,
  });

  final bool groupChats;
  final DateTime? beforeDateTime;
  final String? beforeChatId;
  final int? limit;
}

// Request for messages for a chat.
final class ChatGetMessagesRequested extends ChatEvent {
  const ChatGetMessagesRequested({
    required this.chatId,
    this.beforeDateTime,
    this.beforeMessageId,
    this.limit,
  });

  final String chatId;
  final DateTime? beforeDateTime;
  final String? beforeMessageId;
  final int? limit;
}

final class ChatSendMessageRequested extends ChatEvent {
  const ChatSendMessageRequested({required this.chatId, required this.message});

  final String chatId;
  final String message;
}

final class ChatMessageInputChanged extends ChatEvent {
  const ChatMessageInputChanged({required this.message});

  final String message;
}

final class ChatUpdateStreamReceived extends ChatEvent {
  const ChatUpdateStreamReceived({required this.update});

  final ChatUpdateStreamItem update;
}

final class ChatResetChatInputRequested extends ChatEvent {
  const ChatResetChatInputRequested();
}
