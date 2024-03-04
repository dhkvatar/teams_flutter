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
  ChatBloc._({
    required this.chatUpdatesStream,
    required this.getChats,
    required this.getMessages,
    required this.sendMessage,
  }) : super(const ChatState()) {
    _addEventHandlers();
    chatUpdatesSubscription = chatUpdatesStream.listen((update) {
      add(ChatUpdateStreamReceived(update: update));
    });
  }

  @factoryMethod
  factory ChatBloc.fromDefaultStream() {
    return ChatBloc._(
      chatUpdatesStream: getIt<GetChatUpdatesStream>()(),
      getChats: getIt<GetChats>(),
      getMessages: getIt<GetMessages>(),
      sendMessage: getIt<SendMessage>(),
    );
  }

  factory ChatBloc.fromParameters({
    required Stream<ChatUpdateStreamItem> chatUpdatesStream,
    required GetChats getChats,
    required GetMessages getMessages,
    required SendMessage sendMessage,
  }) {
    return ChatBloc._(
      chatUpdatesStream: chatUpdatesStream,
      getChats: getChats,
      getMessages: getMessages,
      sendMessage: sendMessage,
    );
  }

  final Stream<ChatUpdateStreamItem> chatUpdatesStream;
  final GetChats getChats;
  final GetMessages getMessages;
  final SendMessage sendMessage;
  late final StreamSubscription<ChatUpdateStreamItem> chatUpdatesSubscription;

  void _addEventHandlers() {
    on<ChatGetChatsRequested>(_onGetChatsRequested);
    on<ChatGetMessagesRequested>(_onGetMessagesRequested);
    on<ChatMessageInputChanged>(_onMessageInputChanged);
    on<ChatSendMessageRequested>(_onSendMessageRequested);
    on<ChatUpdateStreamReceived>(_onUpdateStreamReceived);
  }

  List<String> _sortedChatIds(List<Chat> chats) {
    chats.sort((a, b) {
      int timeComparison = b.updateTime.compareTo(a.updateTime);
      if (timeComparison == 0) {
        return b.id.compareTo(a.id);
      }
      return timeComparison;
    });

    List<String> res = [];
    for (int i = 0; i < chats.length; i++) {
      res.add(chats.elementAt(i).id);
    }
    return res;
  }

  Future<void> _onUpdateStreamReceived(
      ChatUpdateStreamReceived event, Emitter<ChatState> emit) async {
    switch (event.update.updateType) {
      case ChatUpdateType.newMessageUploadSuccess:
        final newMsgId = event.update.newMessageId!;
        emit(
          state.copyWith(
            messagesById: {
              ...state.messagesById,
              newMsgId: state.messagesById[newMsgId]!
                  .copyWith(uploadStatus: MessageUploadStatus.success),
            },
          ),
        );
      case ChatUpdateType.newMessageUploadFailure:
        final newMsgId = event.update.newMessageId!;
        emit(
          state.copyWith(
            messagesById: {
              ...state.messagesById,
              newMsgId: state.messagesById[newMsgId]!
                  .copyWith(uploadStatus: MessageUploadStatus.timeout),
            },
          ),
        );
    }
  }

  Future<void> _onGetChatsRequested(
    ChatGetChatsRequested event,
    Emitter<ChatState> emit,
  ) async {
    try {
      emit(state.copyWith(chatsLoadingStatus: ChatsLoadingStatus.inProgress));
      final newChats = await getChats(
        GetChatsParams(
          beforeDateTime: event.beforeDateTime,
          beforeId: event.beforeChatId,
          limit: event.limit,
        ),
      );
      final sortedDmIds = _sortedChatIds([
        ...newChats.where((chat) => !chat.isGroupChat),
        ...state.chatsById.values.where((chat) => !chat.isGroupChat).toList(),
      ]);
      final sortedGroupChatIds = _sortedChatIds([
        ...newChats.where((chat) => chat.isGroupChat),
        ...state.chatsById.values.where((chat) => chat.isGroupChat).toList(),
      ]);

      emit(state.copyWith(
        chatsById: {
          ...state.chatsById,
          ...{for (var chat in newChats) chat.id: chat}
        },
        directMessageChats: sortedDmIds,
        groupChats: sortedGroupChatIds,
        lastDirectMessageChat: sortedDmIds.isNotEmpty ? sortedDmIds.last : null,
        lastGroupChat:
            sortedGroupChatIds.isNotEmpty ? sortedGroupChatIds.last : null,
        chatsLoadingStatus: ChatsLoadingStatus.complete,
      ));
    } catch (e) {
      emit(state.copyWith(
        chatsLoadingStatus: ChatsLoadingStatus.complete,
        errorMessage: 'Error fetching Chats: ${e.toString()}',
      ));
    }
  }

  Map<DateTime, List<String>> _groupAndSortMessageIdsByDate(
      Map<String, Message> messages) {
    final messageIds = messages.keys.toList();
    Map<DateTime, List<String>> res = {};
    for (var msgId in messageIds) {
      final message = messages[msgId]!;
      final date = DateTime(
          message.sentTime.year, message.sentTime.month, message.sentTime.day);
      res.putIfAbsent(date, () => []);
      res[date]!.add(message.id);
    }

    res.forEach((date, messagesForDate) {
      messagesForDate.sort((a, b) {
        final msgA = messages[a]!;
        final msgB = messages[b]!;
        final timeComparison = msgA.sentTime.compareTo(msgB.sentTime);
        if (timeComparison == 0) {
          return msgA.id.compareTo(msgB.id);
        }
        return timeComparison;
      });
    });
    return res;
  }

  Future<void> _onGetMessagesRequested(
    ChatGetMessagesRequested event,
    Emitter<ChatState> emit,
  ) async {
    try {
      emit(state.copyWith(
          messagesLoadingStatus: MessagesLoadingStatus.inProgress));
      final newMessages = await getMessages(
        GetMessagesParams(
          chatId: event.chatId,
          beforeDateTime: event.beforeDateTime,
          beforeId: event.beforeMessageId,
          limit: event.limit,
        ),
      );
      final allMessagesById = {
        ...state.messagesById,
        ...{for (var msg in newMessages) msg.id: msg},
      };
      final sortedMessagesGroupedByDate =
          _groupAndSortMessageIdsByDate(allMessagesById);

      emit(state.copyWith(
        messagesById: allMessagesById,
        chatMessagesByDate: {
          ...state.chatMessagesByDate,
          event.chatId: sortedMessagesGroupedByDate
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
        final sentMessage = await sendMessage(
            SendMessageParams(chatId: event.chatId, message: event.message));
        final allMessagesById = {
          ...state.messagesById,
          sentMessage.id: sentMessage.copyWith(
              uploadStatus: MessageUploadStatus.uploadInProgress),
        };
        final sortedMessagesGroupedByDate =
            _groupAndSortMessageIdsByDate(allMessagesById);

        emit(state.copyWith(
          messagesById: allMessagesById,
          chatInput: const ChatInput.pure(),
          chatMessagesByDate: {
            ...state.chatMessagesByDate,
            event.chatId: sortedMessagesGroupedByDate,
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
    chatUpdatesSubscription.cancel();
    return super.close();
  }
}
