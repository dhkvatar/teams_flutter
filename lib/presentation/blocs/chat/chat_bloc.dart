import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/core/constants/chat_constants.dart';
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
import 'package:teams/presentation/ui/utils/date_time_utils.dart';

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

  // Subscription to the chatUpdatesStream
  late final StreamSubscription<ChatUpdateStreamItem> chatUpdatesSubscription;

  final _chatsListingController =
      BehaviorSubject<ChatsPagingState>.seeded(const ChatsPagingState());
  Stream<ChatsPagingState> get chatListingsStream =>
      _chatsListingController.stream;

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

  Map<DateTime, List<String>> _groupAndSortMessageIdsByDateTime(
      Map<String, Message> messages, String? chatId) {
    final messageIds = messages.keys.toList();
    Map<DateTime, List<String>> res = {};
    for (var msgId in messageIds) {
      final message = messages[msgId]!;
      if (chatId != null && message.chatId != chatId) {
        continue;
      }
      final dateTime = getDateHourMin(message.sentTime);
      // DateTime(message.sentTime.year, message.sentTime.month,
      //     message.sentTime.day, message.sentTime.hour, message.sentTime.minute);
      res.putIfAbsent(dateTime, () => []);
      res[dateTime]!.add(message.id);
    }

    res.forEach((dateTime, messagesForDateTime) {
      messagesForDateTime.sort((a, b) {
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
      // Signal to UI that loading of new chats is in-progress.
      emit(state.copyWith(chatsLoadingStatus: ChatsLoadingStatus.inProgress));
      final newChats = await getChats(
        GetChatsParams(
          groupChats: event.groupChats,
          beforeDateTime: event.beforeDateTime,
          beforeId: event.beforeChatId,
          limit: event.limit,
        ),
      );

      final sortedChatIds = _sortedChatIds([
        ...newChats.where((chat) => chat.isGroupChat == event.groupChats),
        ...state.chatsById.values
            .where((chat) => chat.isGroupChat == event.groupChats)
            .toList(),
      ]);

      // Combine new chats with existing and sort by update time and Id.
      final sortedDmIds = _sortedChatIds([
        ...newChats.where((chat) => !chat.isGroupChat),
        ...state.chatsById.values.where((chat) => !chat.isGroupChat).toList(),
      ]);
      final sortedGroupChatIds = _sortedChatIds([
        ...newChats.where((chat) => chat.isGroupChat),
        ...state.chatsById.values.where((chat) => chat.isGroupChat).toList(),
      ]);

      final updatedChatsById = {
        ...state.chatsById,
        ...{for (var chat in newChats) chat.id: chat}
      };

      final oldestChat = sortedChatIds.isNotEmpty
          ? updatedChatsById[sortedChatIds.last]
          : null;

      final newPagingState = event.groupChats
          ? ChatsPagingState(
              oldestGroupChatId: oldestChat?.id,
              oldestGroupChatDateTime: oldestChat?.updateTime,
              isOldestGroupChat:
                  newChats.length < (event.limit ?? ChatConstants.chatPageSize),
            )
          : ChatsPagingState(
              oldestDirectChatId: oldestChat?.id,
              oldestDirectChatUpdateTime: oldestChat?.updateTime,
              isOldestDirectChat:
                  newChats.length < (event.limit ?? ChatConstants.chatPageSize),
            );

      // Emit chat listing update to stream
      _chatsListingController.add(newPagingState
          // state.chatsPagingState.copyWith(
          //   oldestDirectChatId: event.groupChats
          //       ? state.chatsPagingState.oldestDirectChatId
          //       : oldestChat?.id,
          //   oldestDirectChatUpdateTime: event.groupChats
          //       ? state.chatsPagingState.oldestDirectChatUpdateTime
          //       : oldestChat?.updateTime,
          //   oldestGroupChatId: event.groupChats
          //       ? oldestChat?.id
          //       : state.chatsPagingState.oldestGroupChatId,
          //   oldestGroupChatDateTime: event.groupChats
          //       ? oldestChat?.updateTime
          //       : state.chatsPagingState.oldestGroupChatDateTime,
          //   isOldestDirectChat: event.groupChats
          //       ? state.chatsPagingState.isOldestDirectChat
          //       : newChats.length < (event.limit ?? ChatConstants.chatPageSize),
          //   isOldestGroupChat: event.groupChats
          //       ? newChats.length < (event.limit ?? ChatConstants.chatPageSize)
          //       : state.chatsPagingState.isOldestGroupChat,
          // ),
          );

      // Emit new state with additionally loaded chats.
      emit(state.copyWith(
        chatsById: updatedChatsById,
        directMessageChats:
            event.groupChats ? state.directMessageChats : sortedChatIds,
        groupChats: event.groupChats ? sortedChatIds : state.groupChats,
        lastDirectMessageChat: sortedDmIds.isNotEmpty ? sortedDmIds.last : null,
        lastGroupChat:
            sortedGroupChatIds.isNotEmpty ? sortedGroupChatIds.last : null,
        chatsLoadingStatus: ChatsLoadingStatus.complete,
      ));
    } catch (e) {
      // Signal to UI that loading of new chats has fialed.
      emit(state.copyWith(
        chatsLoadingStatus: ChatsLoadingStatus.failed,
        errorMessage: 'Error fetching Chats: ${e.toString()}',
      ));
    }
  }

  Message? _getOldestMessage(List<Message> messages) {
    messages.sort((a, b) {
      return a.sentTime.compareTo(b.sentTime);
    });
    return messages.isNotEmpty ? messages.first : null;
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
      final sortedMessagesGroupedByDateTime =
          _groupAndSortMessageIdsByDateTime(allMessagesById, event.chatId);

      emit(state.copyWith(
        messagesById: allMessagesById,
        chatMessagesByDateTime: {
          ...state.chatMessagesByDateTime,
          event.chatId: sortedMessagesGroupedByDateTime
        },
        lastChatAccess: {...state.lastChatAccess, event.chatId: DateTime.now()},
        lastMessageByChat: {
          ...state.lastMessageByChat,
          event.chatId: _getOldestMessage(allMessagesById.values
                  .where((msg) => msg.chatId == event.chatId)
                  .toList())
              ?.id,
        },
        messagesLoadingStatus: MessagesLoadingStatus.complete,
      ));
    } catch (e) {
      emit(state.copyWith(
        messagesLoadingStatus: MessagesLoadingStatus.failed,
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
            _groupAndSortMessageIdsByDateTime(allMessagesById, event.chatId);

        emit(state.copyWith(
          messagesById: allMessagesById,
          chatInput: const ChatInput.pure(),
          chatMessagesByDateTime: {
            ...state.chatMessagesByDateTime,
            event.chatId: sortedMessagesGroupedByDate,
          },
          lastMessageByChat: {
            event.chatId:
                state.lastMessageByChat[event.chatId] ?? sentMessage.id
          },
          formzStatus: FormzSubmissionStatus.success,
          isValid: false,
        ));
      } catch (e) {
        emit(state.copyWith(
          formzStatus: FormzSubmissionStatus.failure,
          chatInput: const ChatInput.pure(),
          isValid: false,
          errorMessage: 'Error sending message: ${e.toString()}',
        ));
      }
    }
  }

  @override
  Future<void> close() {
    chatUpdatesSubscription.cancel();
    return super.close();
  }
}
