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

  // Stream of updates sent from the repository.
  final Stream<ChatUpdateStreamItem> chatUpdatesStream;

  // GetChats use case to retrieve chats from the chat repository.
  final GetChats getChats;

  // GetMessages use case to retrieve messages from the chat repository.
  final GetMessages getMessages;

  // SendMessage use case to send messages (upload) to the chat repository.
  final SendMessage sendMessage;

  // Subscription to the chatUpdatesStream to update bloc state from updates
  // sent from the chat repository.
  late final StreamSubscription<ChatUpdateStreamItem> chatUpdatesSubscription;

  // Used to manage yielded ChatsPagingState in the chatsPagingStateStream.
  final _chatsListingController =
      BehaviorSubject<ChatsPagingState>.seeded(const ChatsPagingState());

  // Stream of ChatPagingState for the UI to load paginated Chats.
  Stream<ChatsPagingState> get chatsPagingStateStream =>
      _chatsListingController.stream;

  // Stores the MessagesPagingState for each of the chatId's previously loaded.
  final Map<String, MessagesPagingState> _messagesPagingStateByChatId = {};

  // Used to manage yielded MessagesPagingState in the streams returned by
  // getMessagesPagingStateStream.
  final _messagesListingController = BehaviorSubject<MessagesPagingState>();

  // Stream of MessagesPagingState's for the UI to load paginated Message's.
  Stream<MessagesPagingState> getMessagesPagingStateStreamForChat(
      String chatId) {
    _messagesListingController.add(_messagesPagingStateByChatId[chatId] ??
        MessagesPagingState(chatId: chatId));
    return _messagesListingController.stream;
  }

  void _addEventHandlers() {
    on<ChatGetChatsRequested>(_onGetChatsRequested);
    on<ChatGetMessagesRequested>(_onGetMessagesRequested);
    on<ChatMessageInputChanged>(_onMessageInputChanged);
    on<ChatSendMessageRequested>(_onSendMessageRequested);
    on<ChatUpdateStreamReceived>(_onUpdateStreamReceived);
  }

  Future<void> _onUpdateStreamReceived(
      ChatUpdateStreamReceived event, Emitter<ChatState> emit) async {
    final newMsgId = event.update.newMessageId!;
    final msg = state.messagesById[newMsgId]!;
    Message newMsg;

    switch (event.update.updateType) {
      case ChatUpdateType.newMessageUploadSuccess:
        newMsg = msg.copyWith(uploadStatus: MessageUploadStatus.success);
        emit(
          state.copyWith(
            messagesById: {...state.messagesById, newMsgId: newMsg},
          ),
        );

      case ChatUpdateType.newMessageUploadFailure:
        newMsg = msg.copyWith(uploadStatus: MessageUploadStatus.timeout);
        emit(
          state.copyWith(
            messagesById: {
              ...state.messagesById,
              newMsgId: newMsg,
            },
          ),
        );
    }
    final curMessagePagingState =
        _messagesPagingStateByChatId[event.update.chatId]!;
    final newMessagePagingState = curMessagePagingState.copyWith(
      messages: {
        ...curMessagePagingState.messages,
        newMsgId: newMsg,
      },
    );
    _messagesListingController.add(newMessagePagingState);
    _messagesPagingStateByChatId[event.update.chatId] = newMessagePagingState;
  }

  Chat? _getOldestChatWithSmallestId(List<Chat> chats) {
    if (chats.isEmpty) {
      return null;
    }
    chats.sort((a, b) => a.updateTime.compareTo(b.updateTime));
    final oldestDateTime = chats.first.updateTime;
    final oldestChats =
        chats.where((chat) => chat.updateTime == oldestDateTime).toList();
    oldestChats.sort((a, b) => a.id.compareTo(b.id));
    return oldestChats.first;
  }

  Future<void> _onGetChatsRequested(
    ChatGetChatsRequested event,
    Emitter<ChatState> emit,
  ) async {
    try {
      // Signal to UI that loading of new chats is in-progress.
      // emit(state.copyWith(chatsLoadingStatus: ChatsLoadingStatus.inProgress));
      final newChats = await getChats(
        GetChatsParams(
          groupChats: event.groupChats,
          beforeDateTime: event.beforeDateTime,
          beforeId: event.beforeChatId,
          limit: event.limit,
        ),
      );

      final updatedChatsById = {
        ...state.chatsById,
        ...{for (var chat in newChats) chat.id: chat}
      };

      final oldestChat =
          _getOldestChatWithSmallestId(updatedChatsById.values.toList());

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
      _chatsListingController.add(newPagingState);

      // Emit new state with additionally loaded chats.
      emit(state.copyWith(
        chatsById: updatedChatsById,
        // chatsLoadingStatus: ChatsLoadingStatus.complete,
      ));
    } catch (e) {
      // Signal to UI that loading of new chats has fialed.
      emit(state.copyWith(
        // chatsLoadingStatus: ChatsLoadingStatus.failed,
        errorMessage: 'Error fetching Chats: ${e.toString()}',
      ));
    }
  }

  Future<void> _onGetMessagesRequested(
    ChatGetMessagesRequested event,
    Emitter<ChatState> emit,
  ) async {
    try {
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

      // get paging here
      final messagesForChat = allMessagesById.values
          .where((msg) => msg.chatId == event.chatId)
          .toList();
      messagesForChat.sort((a, b) => a.sentTime.compareTo(b.sentTime));

      final newPagingState = MessagesPagingState(
        chatId: event.chatId,
        oldestMessageId: messagesForChat.first.id,
        oldestMessageSentTime: messagesForChat.first.sentTime,
        isOldestMessage:
            newMessages.length < (event.limit ?? ChatConstants.chatPageSize),
        messages: {for (var msg in messagesForChat) msg.id: msg},
        // messages: messagesForChat,
      );

      // Yield new paging state.
      _messagesListingController.add(newPagingState);
      // Store the paging state.
      _messagesPagingStateByChatId[event.chatId] = newPagingState;

      // Emit new ChatState.
      emit(state.copyWith(
        messagesById: allMessagesById,
        lastChatAccess: {...state.lastChatAccess, event.chatId: DateTime.now()},
      ));
    } catch (e) {
      emit(state.copyWith(
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

        emit(state.copyWith(
          messagesById: allMessagesById,
          chatInput: const ChatInput.pure(),
          formzStatus: FormzSubmissionStatus.success,
          isValid: false,
        ));

        // Update paging state.
        final newPagingState =
            _messagesPagingStateByChatId[event.chatId]!.copyWith(
          messages: {
            ..._messagesPagingStateByChatId[event.chatId]!.messages,
            sentMessage.id: sentMessage,
          },
        );
        _messagesListingController.add(newPagingState);
        _messagesPagingStateByChatId[event.chatId] = newPagingState;
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
