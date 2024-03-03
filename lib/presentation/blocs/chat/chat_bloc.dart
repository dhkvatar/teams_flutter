import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/core/forms/chat.dart';
import 'package:teams/domain/entities/chat.dart';
import 'package:teams/domain/entities/message.dart';
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
  }

  // The oldest chats should appear last.
  // The latest chats appear first.
  void _sortChatsBySentTimeAndId(List<Chat> chats) {
    chats.sort((a, b) {
      // a comes first if b's updateTime is smaller
      // a comes first if a's updateTime is larger
      int timeComparison = b.updateTime.compareTo(a.updateTime);
      if (timeComparison == 0) {
        return b.id.compareTo(a.id);
      }
      return timeComparison;
    });
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

      final existing = state.chatMessages[event.chatId] ?? [];
      final allMessages = [...existing, ...messages];
      _sortMessagesBySentTimeAndId(allMessages);

      final groupedMessages = state.chatMessagesByDate[event.chatId] ?? {};
      for (final message in messages) {
        DateTime dateKey = DateTime(message.sentTime.year,
            message.sentTime.month, message.sentTime.day);
        groupedMessages.putIfAbsent(dateKey, () => []);
        groupedMessages[dateKey]!.add(message);
      }
      groupedMessages.forEach((date, messages) {
        _sortMessagesBySentTimeAndId(messages);
      });

      emit(state.copyWith(
        chatMessagesByDate: {
          ...state.chatMessagesByDate,
          event.chatId: groupedMessages,
        },
        chatMessages: {...state.chatMessages, event.chatId: allMessages},
        lastMessage: {
          ...state.lastMessage,
          event.chatId: allMessages.isNotEmpty ? allMessages.last : null,
        },
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
          chatMessages: {
            ...state.chatMessages,
            event.chatId: [
              ...state.chatMessages[event.chatId] ?? [],
              sentMessage,
            ]
          },
          formzStatus: FormzSubmissionStatus.success,
          isValid: false,
        ));
      } catch (_) {
        emit(state.copyWith(formzStatus: FormzSubmissionStatus.failure));
      }
    }
  }
}
