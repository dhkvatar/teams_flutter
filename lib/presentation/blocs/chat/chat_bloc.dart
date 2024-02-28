import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/domain/entities/chat.dart';
import 'package:teams/domain/usecases/chat/get_chats.dart';
import 'package:teams/presentation/blocs/chat/chat_event.dart';
import 'package:teams/presentation/blocs/chat/chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatState()) {
    on<ChatGetChatsRequested>(_onGetChatsRequested);
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
          afterDateTime: event.afterDateTime,
          afterId: event.afterChatId,
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
        lastDirectMessageChat: dms[dms.length - 1],
        lastGroupChat: groupChats[groupChats.length - 1],
        chatsLoadingStatus: ChatsLoadingStatus.complete,
      ));
    } catch (e) {
      emit(state.copyWith(
        chatsLoadingStatus: ChatsLoadingStatus.complete,
        errorMessage: 'Error fetching Chats: ${e.toString()}',
      ));
    }
  }
}
