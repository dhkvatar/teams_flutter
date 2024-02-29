import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/domain/entities/chat.dart';
import 'package:teams/domain/entities/message.dart';
import 'package:teams/domain/usecases/chat/get_chats.dart';
import 'package:teams/domain/usecases/chat/get_messages.dart';
import 'package:teams/presentation/blocs/chat/chat_event.dart';
import 'package:teams/presentation/blocs/chat/chat_state.dart';

@lazySingleton
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatState()) {
    on<ChatGetChatsRequested>(_onGetChatsRequested);
    on<ChatGetMessagesRequested>(_onGetMessagesRequested);
  }

  void _sortChatsBySentTimeAndId(List<Chat> chats) {
    chats.sort((a, b) {
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
        lastDirectMessageChat: dms.isNotEmpty ? dms[dms.length - 1] : null,
        lastGroupChat:
            groupChats.isNotEmpty ? groupChats[groupChats.length - 1] : null,
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

      final Map<String, List<Message>> newChatMessages =
          Map.from(state.chatMessages);
      newChatMessages[event.chatId] = allMessages;

      final Map<String, Message> newLastMessage = Map.from(state.lastMessage);
      if (allMessages.isNotEmpty) {
        newLastMessage[event.chatId] = allMessages.last;
      }

      emit(state.copyWith(
        chatMessages: newChatMessages,
        lastMessage: newLastMessage,
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
