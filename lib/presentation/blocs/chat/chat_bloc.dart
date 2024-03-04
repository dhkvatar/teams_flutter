import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/core/forms/chat.dart';
import 'package:teams/domain/entities/chat.dart';
import 'package:teams/domain/entities/message.dart';
import 'package:teams/domain/repositories/chat_repository.dart';
import 'package:teams/domain/usecases/chat/get_chat_updates_stream.dart';
import 'package:teams/domain/usecases/chat/get_chats.dart';
import 'package:teams/domain/usecases/chat/get_messages.dart';
import 'package:teams/domain/usecases/chat/send_message.dart';
import 'package:teams/presentation/blocs/chat/chat_event.dart';
import 'package:teams/presentation/blocs/chat/chat_state.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatState()) {
    on<ChatGetChatsRequested>(_onGetChatsRequested);
    on<ChatGetMessagesRequested>(_onGetMessagesRequested);
    on<ChatMessageInputChanged>(_onMessageInputChanged);
    on<ChatSendMessageRequested>(_onSendMessageRequested);
    on<ChatUpdateStreamReceived>(_onUpdateStreamReceived);
    _chatUpdatesSubscription = getIt<GetChatUpdatesStream>()().listen((update) {
      add(ChatUpdateStreamReceived(update: update));
    });
  }

  // late final StreamSubscription<Message> _messageUploadSubscription;
  late final StreamSubscription<ChatUpdateStreamItem> _chatUpdatesSubscription;

  void _sortChatsBySentTimeAndId(List<Chat> chats) {
    chats.sort((a, b) {
      int timeComparison = b.updateTime.compareTo(a.updateTime);
      if (timeComparison == 0) {
        return b.id.compareTo(a.id);
      }
      return timeComparison;
    });
  }

  Future<void> _onUpdateStreamReceived(
      ChatUpdateStreamReceived event, Emitter<ChatState> emit) async {
    switch (event.update.updateType) {
      case ChatUpdateType.newMessageUploadSuccess:
        final Map<String, Message> pendingMessagesForChat =
            Map.from(state.pendingMessagesById[event.update.chatId] ?? {});
        pendingMessagesForChat.remove(event.update.newMessageId ?? '');
        emit(
          state.copyWith(
            // Remove the acked message from the pending messages map.
            pendingMessagesById: {
              ...state.pendingMessagesById,
              event.update.chatId: pendingMessagesForChat,
            },
          ),
        );
      case ChatUpdateType.newMessageUploadFailure:
      // TODO: Handle this case.
    }
  }

  Future<void> _onGetChatsRequested(
    ChatGetChatsRequested event,
    Emitter<ChatState> emit,
  ) async {
    try {
      emit(state.copyWith(chatsLoadingStatus: ChatsLoadingStatus.inProgress));
      final chats = await getIt<GetChats>()(
        GetChatsParams(
          beforeDateTime: event.beforeDateTime,
          beforeId: event.beforeChatId,
          limit: event.limit,
        ),
      );

      final dms = [
        ...state.directMessageChats,
        ...chats.where((element) => !element.isGroupChat).toList()
      ];
      final groupChats = [
        ...state.groupChats,
        ...chats.where((element) => element.isGroupChat).toList()
      ];
      _sortChatsBySentTimeAndId(dms);
      _sortChatsBySentTimeAndId(groupChats);

      emit(state.copyWith(
        directMessageChats: dms,
        groupChats: groupChats,
        lastDirectMessageChat: dms.isNotEmpty ? dms.last : null,
        lastGroupChat: groupChats.isNotEmpty ? groupChats.last : null,
        chatsLoadingStatus: ChatsLoadingStatus.complete,
      ));
    } catch (e) {
      emit(state.copyWith(
        chatsLoadingStatus: ChatsLoadingStatus.complete,
        errorMessage: 'Error fetching Chats: ${e.toString()}',
      ));
    }
  }

  void _sortMessagesBySentTimeAndId(List<Message> messages) {
    messages.sort((a, b) {
      int timeComparison = a.sentTime.compareTo(b.sentTime);
      if (timeComparison == 0) {
        return a.id.compareTo(b.id);
      }
      return timeComparison;
    });
  }

  Future<void> _onGetMessagesRequested(
    ChatGetMessagesRequested event,
    Emitter<ChatState> emit,
  ) async {
    try {
      emit(state.copyWith(
          messagesLoadingStatus: MessagesLoadingStatus.inProgress));
      final messages = await getIt<GetMessages>()(
        GetMessagesParams(
          chatId: event.chatId,
          beforeDateTime: event.beforeDateTime,
          beforeId: event.beforeMessageId,
          limit: event.limit,
        ),
      );

      Message? last;
      final groupedMessages = state.chatMessagesByDate[event.chatId] ?? {};

      for (final message in messages) {
        DateTime dateKey = DateTime(message.sentTime.year,
            message.sentTime.month, message.sentTime.day);
        groupedMessages.putIfAbsent(dateKey, () => []);
        groupedMessages[dateKey]!.add(message);

        if (last == null) {
          last = message;
        } else if (last.sentTime.compareTo(message.sentTime) != 0) {
          last = message.sentTime.isBefore(last.sentTime) ? message : last;
        } else {
          last = message.id.compareTo(last.id) < 0 ? message : last;
        }
      }
      groupedMessages.forEach((date, messages) {
        _sortMessagesBySentTimeAndId(messages);
      });

      emit(state.copyWith(
        chatMessagesByDate: {
          ...state.chatMessagesByDate,
          event.chatId: groupedMessages,
        },
        lastMessage: last != null ? {last.id: last} : {},
        lastChatAccess: {...state.lastChatAccess, event.chatId: DateTime.now()},
        messagesLoadingStatus: MessagesLoadingStatus.complete,
      ));
    } catch (e) {
      emit(state.copyWith(
        messagesLoadingStatus: MessagesLoadingStatus.complete,
        errorMessage: 'Error fetching messages: ${e.toString()}',
      ));
    }
  }

  Future<void> _onMessageInputChanged(
      ChatMessageInputChanged event, Emitter<ChatState> emit) async {
    final chatInput = ChatInput.dirty(event.message);
    emit(state.copyWith(
      chatInput: chatInput,
      isValid: Formz.validate([chatInput]),
    ));
  }

  Future<void> _onSendMessageRequested(
      ChatSendMessageRequested event, Emitter<ChatState> emit) async {
    if (state.isValid) {
      emit(state.copyWith(formzStatus: FormzSubmissionStatus.inProgress));
      try {
        final sentMessage = await getIt<SendMessage>()(
            SendMessageParams(chatId: event.chatId, message: event.message));
        final sentDate = DateTime(sentMessage.sentTime.year,
            sentMessage.sentTime.month, sentMessage.sentTime.day);
        final messagesByDate = state.chatMessagesByDate[event.chatId] ?? {};
        messagesByDate.putIfAbsent(sentDate, () => []);
        final sortedMessagesForDate = [
          ...messagesByDate[sentDate]!,
          sentMessage
        ];
        _sortMessagesBySentTimeAndId(sortedMessagesForDate);

        emit(state.copyWith(
          chatInput: const ChatInput.pure(),
          pendingMessagesById: {
            ...state.pendingMessagesById,
            event.chatId: {
              ...state.pendingMessagesById[event.chatId] ?? {},
              sentMessage.id: sentMessage,
            }
          },
          chatMessagesByDate: {
            ...state.chatMessagesByDate,
            event.chatId: {
              ...state.chatMessagesByDate[event.chatId] ?? {},
              sentDate: sortedMessagesForDate,
            },
          },
          formzStatus: FormzSubmissionStatus.success,
          isValid: false,
        ));
      } catch (_) {
        emit(state.copyWith(formzStatus: FormzSubmissionStatus.failure));
      }
    }
  }

  @override
  Future<void> close() {
    _chatUpdatesSubscription.cancel();
    return super.close();
  }
}
