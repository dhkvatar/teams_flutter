sealed class ChatEvent {
  const ChatEvent();
}

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
