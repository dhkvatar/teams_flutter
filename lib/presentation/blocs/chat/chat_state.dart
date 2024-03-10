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

    // All messagtes loaded by Id.
    @Default({}) Map<String, Message> messagesById,

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
    // The chat with the oldest updateTime that's currently loaded.
    String? oldestChatId,

    // The update time of the oldest chat.
    DateTime? oldestChatUpdateTime,

    // Whether the current oldestChatId is the oldest chat in the chat repository.
    @Default(false) bool isOldestChat,
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

    // The messages loaded for the chat over all pages, sorted.
    @Default({}) Map<String, Message> messages,
  }) = _MessagesPagingState;
}
