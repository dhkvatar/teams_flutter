sealed class ChatEvent {
  const ChatEvent();
}

// Request for chats.
final class ChatGetChatsRequested extends ChatEvent {
  const ChatGetChatsRequested({
    this.beforeDateTime,
    this.beforeChatId,
    this.limit = 20,
  });

  final DateTime? beforeDateTime;
  final String? beforeChatId;
  final int? limit;
}

// Request for messages for a chat.
// final class ChatGetMessagesForChatRequested extends ChatEvent {
//   const ChatGetMessagesForChatRequested();

//   final String chatId;
// }
