import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/domain/entities/chat.dart';
import 'package:teams/domain/entities/message.dart';
import 'package:teams/domain/usecases/chat/get_chats.dart';
import 'package:teams/domain/usecases/chat/get_messages.dart';
import 'package:teams/presentation/blocs/chat/chat_event.dart';
import 'package:teams/presentation/blocs/chat/chat_state.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatState()) {
    on<ChatGetChatsRequested>(_onGetChatsRequested);
    on<ChatGetMessagesRequested>(_onGetMessagesRequested);
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

  // Oldest messages should appear last.
  // Latest messages should appear first.
  void _sortMessagesBySentTimeAndId(List<Message> messages) {
    // a appears first if a's sentTime is earlier
    messages.sort((a, b) {
      int timeComparison = b.sentTime.compareTo(a.sentTime);
      if (timeComparison == 0) {
        return b.id.compareTo(a.id);
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

      final allDatesForChat = state.sortedDates[event.chatId]?.toSet() ?? {};
      final groupedMessages = state.chatMessagesByDate[event.chatId] ?? {};
      for (final message in messages) {
        DateTime dateKey = DateTime(message.sentTime.year,
            message.sentTime.month, message.sentTime.day);
        groupedMessages.putIfAbsent(dateKey, () => []);
        allDatesForChat.add(dateKey);
        groupedMessages[dateKey]!.add(message);
      }
      groupedMessages.forEach((date, messages) {
        _sortMessagesBySentTimeAndId(messages);
      });
      final sortedDatesList = allDatesForChat.toList();
      sortedDatesList.sort((a, b) => b.compareTo(a));

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
        sortedDates: {...state.sortedDates, event.chatId: sortedDatesList},
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
}
