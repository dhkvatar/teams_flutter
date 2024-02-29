sealed class ChatEvent {
  const ChatEvent();
}

// Request for chats.
final class ChatGetChatsRequested extends ChatEvent {
  const ChatGetChatsRequested({
    this.afterDateTime,
    this.afterChatId,
    this.limit = 20,
  });

  final DateTime? afterDateTime;
  final String? afterChatId;
  final int? limit;
}
