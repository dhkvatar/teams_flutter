import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teams/domain/entities/chat.dart';
import 'package:teams/domain/entities/message.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    // List of direct message chats, sorted by updateTime and Id (descending).
    @Default([]) List<Chat> directMessageChats,

    // List of group chats, sorted by updateTime and Id (descending).
    @Default([]) List<Chat> groupChats,

    // The last direct message chat by updateTime and Id, i.e., the earliest
    // created with the smallest Id in directMessageChats.
    Chat? lastDirectMessageChat,

    // The last group chat by updateTime and Id, i.e., the earliest created
    // with the smallest Id in groupChats.
    Chat? lastGroupChat,

    // Map from Chat Id to the last message (earliest timestamp and smallest
    // Id) for each chat.
    @Default({}) Map<String, Message> lastMessage,

    // The loading status of the chats on the chat page.
    @Default(ChatsLoadingStatus.complete) chatsLoadingStatus,

    // The loading status of the messages on the chat details page.
    @Default(MessagesLoadingStatus.complete) messagesLoadingStatus,

    // Loaded messages for each chat.
    @Default({}) Map<String, List<Message>> chatMessages,

    // Error message to display after processing a ChatEvent.
    String? errorMessage,
  }) = _ChatState;
}

enum ChatsLoadingStatus {
  inProgress,
  complete,
}

enum MessagesLoadingStatus {
  inProgress,
  complete,
}
