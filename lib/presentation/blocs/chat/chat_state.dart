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

    // Map from Chat Id to the ID of the last message (earliest timestamp and smallest
    // Id) for each chat.
    @Default({}) Map<String, String?> lastMessageByChat,

    // The loading status of the messages on the chat details page.
    @Default(MessagesLoadingStatus.complete) messagesLoadingStatus,

    // All messagtes loaded by Id.
    @Default({}) Map<String, Message> messagesById,

    // Map from Chat Id to a map of dates to messages of the Chat.
    // The messages Ids are sorted by sent time and ID (descending).
    @Default({})
    Map<String, Map<DateTime, List<String>>> chatMessagesByDateTime,

    // The last access time of each chat during the session.
    @Default({}) Map<String, DateTime?> lastChatAccess,

    // The chat input state.
    @Default(ChatInput.pure()) ChatInput chatInput,

    // The status of chat input submission.
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus formzStatus,

    // Whether the state of the bloc is valid for chat send submission.
    @Default(false) bool isValid,

    // Error message to display after processing a ChatEvent.
    String? errorMessage,
  }) = _ChatState;
}

// The paging state of loaded chats - the oldest chats retrieved for each
// direct and group chat.
@freezed
class ChatsPagingState with _$ChatsPagingState {
  const factory ChatsPagingState({
    // The DM chat with the oldest updateTime that's currently loaded.
    String? oldestDirectChatId,

    // The update time of the oldest direct message chat.
    DateTime? oldestDirectChatUpdateTime,

    // The group chat with the oldest updateTime that's currently loaded.
    String? oldestGroupChatId,

    // The update time of the oldest group chat.
    DateTime? oldestGroupChatDateTime,

    // Whether the current oldestDirectChatId is the oldest direct chat.
    @Default(false) bool isOldestDirectChat,

    // Whether the current oldestGroupChatId is the oldest group chat.
    @Default(false) bool isOldestGroupChat,
  }) = _ChatsPagingState;
}

// The paging state of loaded messages for a chat.
// The oldest message retrieve for the chat.
@freezed
class MessagesPagingState with _$MessagesPagingState {
  const factory MessagesPagingState({
    // The Id of the Chat that the state represents.
    required String chatId,

    // The Id of the oldest message for the chat currently loaded.
    String? oldestMessageId,

    // The sent time of the oldest message for the chat.
    DateTime? oldestMessageSentTime,

    // Whether the current oldestMessageId is the oldest message in the chat.
    @Default(false) bool isOldestMessage,
  }) = _MessagesPagingState;
}

enum MessagesLoadingStatus {
  inProgress,
  complete,
  failed,
}
