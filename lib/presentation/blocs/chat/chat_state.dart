import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teams/core/forms/chat.dart';
import 'package:teams/domain/entities/chat.dart';
import 'package:teams/domain/entities/message.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    // All chats loaded by Id.
    @Default({}) Map<String, Chat> chatsById,

    // List of direct message chats, sorted by updateTime and Id (descending).
    @Default([]) List<String> directMessageChats,

    // List of group chats, sorted by updateTime and Id (descending).
    @Default([]) List<String> groupChats,

    // The last direct message chat by updateTime and Id, i.e., the earliest
    // created with the smallest Id in directMessageChats.
    String? lastDirectMessageChat,

    // The last group chat by updateTime and Id, i.e., the earliest created
    // with the smallest Id in groupChats.
    String? lastGroupChat,

    // Map from Chat Id to the ID of the last message (earliest timestamp and smallest
    // Id) for each chat.
    @Default({}) Map<String, String?> lastMessageByChat,

    // The loading status of the chats on the chat page.
    @Default(ChatsLoadingStatus.complete) chatsLoadingStatus,

    // The loading status of the messages on the chat details page.
    @Default(MessagesLoadingStatus.complete) messagesLoadingStatus,

    // All messagtes loaded by Id.
    @Default({}) Map<String, Message> messagesById,

    // Map from Chat Id to a map of dates to messages of the Chat.
    // The messages Ids are sorted by sent time and ID (descending).
    @Default({}) Map<String, Map<DateTime, List<String>>> chatMessagesByDate,

    // The last access time of each chat during the session.
    @Default({}) Map<String, DateTime> lastChatAccess,

    // The chat input state.
    @Default(ChatInput.pure()) ChatInput chatInput,

    // The status of chat input submission.
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus formzStatus,

    // Whether the state of the bloc is valid for chat send submission.
    @Default(false) bool isValid,

    // Pending messages (message.uploadStatus == uploadInProgress) by Id for each chat.
    // The first key is the Chat Id, the second is the pending messages by Id.
    @Default({}) Map<String, Map<String, Message>> pendingMessagesById,

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
