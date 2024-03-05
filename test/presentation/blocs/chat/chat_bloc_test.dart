import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:teams/core/exceptions/chat_exception.dart';
import 'package:teams/core/forms/chat.dart';
import 'package:teams/domain/entities/chat.dart';
import 'package:teams/domain/entities/message.dart';
import 'package:teams/domain/repositories/chat_repository.dart';
import 'package:teams/domain/usecases/chat/get_chats.dart';
import 'package:teams/domain/usecases/chat/get_messages.dart';
import 'package:teams/domain/usecases/chat/send_message.dart';
import 'package:teams/presentation/blocs/chat/chat_bloc.dart';
import 'package:teams/presentation/blocs/chat/chat_event.dart';
import 'package:teams/presentation/blocs/chat/chat_state.dart';

@GenerateNiceMocks([
  MockSpec<Stream>(),
  MockSpec<GetChats>(),
  MockSpec<GetMessages>(),
  MockSpec<SendMessage>(),
])
import 'chat_bloc_test.mocks.dart';

List<Chat> chats = [
  Chat(
      id: 'chat_id_1',
      userIds: ['user_id_1', 'user_id_2'],
      name: 'test_chat_1',
      createTime: DateTime(2022, 2, 1),
      updateTime: DateTime(2022, 2, 1),
      isGroupChat: false),
  Chat(
      id: 'chat_id_2',
      userIds: ['user_id_1', 'user_id_2'],
      name: 'test_chat_2',
      createTime: DateTime(2022, 2, 1),
      updateTime: DateTime(2022, 2, 1),
      isGroupChat: false),
  Chat(
    id: 'chat_id_3',
    userIds: ['user_id_1', 'user_id_2', 'user_id_3'],
    name: 'test_chat_3',
    createTime: DateTime(2022, 2, 2),
    updateTime: DateTime(2022, 2, 2),
    isGroupChat: true,
  ),
  Chat(
    id: 'chat_id_4',
    userIds: ['user_id_1', 'user_id_2', 'user_id_3'],
    name: 'test_chat_4',
    createTime: DateTime(2022, 2, 2),
    updateTime: DateTime(2022, 2, 2),
    isGroupChat: true,
  ),
  Chat(
    id: 'chat_id_5',
    userIds: ['user_id_1', 'user_id_2', 'user_id_3'],
    name: 'test_chat_5',
    createTime: DateTime(2022, 2, 3),
    updateTime: DateTime(2022, 2, 3),
    isGroupChat: true,
  ),
];

void main() {
  group(ChatBloc, () {
    group('initialization', () {
      final mockChatUpdatesStream = MockStream<ChatUpdateStreamItem>();

      blocTest(
        'state is default ChatState',
        setUp: () {
          when(mockChatUpdatesStream.listen(any)).thenAnswer(
            (inv) =>
                const Stream<ChatUpdateStreamItem>.empty().listen((event) {}),
          );
        },
        build: () => ChatBloc.fromParameters(
          chatUpdatesStream: mockChatUpdatesStream,
          getChats: MockGetChats(),
          getMessages: MockGetMessages(),
          sendMessage: MockSendMessage(),
        ),
        verify: (bloc) => expect(bloc.state, const ChatState()),
      );
    });

    group(ChatSendMessageRequested, () {
      late MockStream<ChatUpdateStreamItem> mockChatUpdatesStream;
      late MockSendMessage mockSendMessage;
      late ChatState initState;
      final chat = Chat(
        id: 'chat_id_1',
        userIds: ['user_id_1', 'user_id_2'],
        name: 'Chat1',
        createTime: DateTime(2022, 2, 1),
        updateTime: DateTime(2022, 2, 2),
        isGroupChat: false,
      );
      final msgTempl = Message(
        id: 'msg_id_1',
        chatId: '',
        senderId: 'user_id_1',
        message: '',
        sentTime: DateTime(2022, 2, 2),
      );
      // The new message that will be sent.
      late Message toSendMsg, prevMsg;

      setUp(() {
        mockChatUpdatesStream = MockStream<ChatUpdateStreamItem>();
        when(mockChatUpdatesStream.listen(any)).thenAnswer(
          (inv) =>
              const Stream<ChatUpdateStreamItem>.empty().listen((event) {}),
        );
      });
      group('failure', () {
        blocTest(
          'SendMessage ChatException state changes',
          setUp: () {
            initState = ChatState(
              chatsById: {'chat_id_1': chat},
              directMessageChats: ['chat_id_1'],
              lastDirectMessageChat: 'chat_id_1',
              chatInput: const ChatInput.dirty('new_message'),
              isValid: true,
            );
            toSendMsg =
                msgTempl.copyWith(chatId: 'chat_id_1', message: 'new_message');
            mockSendMessage = MockSendMessage();
            when(mockSendMessage.call(any)).thenAnswer((invocation) async {
              throw const ChatException(
                  type: ChatExceptionType.unauthenticated);
            });
          },
          build: () => ChatBloc.fromParameters(
              chatUpdatesStream: mockChatUpdatesStream,
              getChats: MockGetChats(),
              getMessages: MockGetMessages(),
              sendMessage: mockSendMessage),
          seed: () => initState,
          act: (bloc) => bloc.add(const ChatSendMessageRequested(
              chatId: 'chat_id_1', message: 'new_message')),
          verify: (bloc) {
            expect(bloc.state.formzStatus, FormzSubmissionStatus.failure);
            expect(bloc.state.chatInput, const ChatInput.pure());
            expect(bloc.state.isValid, false);
            expect(bloc.state.errorMessage, isNotNull);
          },
        );
      });
      group('success', () {
        blocTest(
          'state changes from initial state with chat created previously but no messages',
          setUp: () {
            // The init state assumes the user is part of 'chat_id_1' without
            // any previous messages.
            initState = ChatState(
              chatsById: {'chat_id_1': chat},
              directMessageChats: ['chat_id_1'],
              lastDirectMessageChat: 'chat_id_1',
              chatInput: const ChatInput.dirty('new_message'),
              isValid: true,
            );
            toSendMsg =
                msgTempl.copyWith(chatId: 'chat_id_1', message: 'new_message');
            mockSendMessage = MockSendMessage();
            when(mockSendMessage.call(any)).thenAnswer((invocation) async {
              return toSendMsg;
            });
          },
          build: () => ChatBloc.fromParameters(
            chatUpdatesStream: mockChatUpdatesStream,
            getChats: MockGetChats(),
            getMessages: MockGetMessages(),
            sendMessage: mockSendMessage,
          ),
          seed: () => initState,
          act: (bloc) => bloc.add(ChatSendMessageRequested(
              chatId: toSendMsg.chatId, message: toSendMsg.message)),
          expect: () => [
            initState.copyWith(
              formzStatus: FormzSubmissionStatus.inProgress,
            ),
            initState.copyWith(
              lastMessageByChat: {toSendMsg.chatId: toSendMsg.id},
              messagesById: {
                toSendMsg.id: toSendMsg.copyWith(
                    uploadStatus: MessageUploadStatus.uploadInProgress),
              },
              chatMessagesByDate: {
                toSendMsg.chatId: {
                  DateTime(toSendMsg.sentTime.year, toSendMsg.sentTime.month,
                      toSendMsg.sentTime.day): [toSendMsg.id]
                },
              },
              isValid: false,
              chatInput: const ChatInput.pure(),
              formzStatus: FormzSubmissionStatus.success,
            ),
          ],
        );
        blocTest(
          'state changes from initial state with chat and messages previously created',
          setUp: () {
            prevMsg = Message(
              id: 'prev_msg_id',
              senderId: 'user_id_1',
              chatId: 'chat_id_1',
              message: 'previous message',
              sentTime: DateTime(2022, 2, 1),
            );
            initState = ChatState(
              chatsById: {'chat_id_1': chat},
              directMessageChats: ['chat_id_1'],
              lastDirectMessageChat: 'chat_id_1',
              lastMessageByChat: {'chat_id_1': 'prev_msg_id'},
              messagesById: {'prev_msg_id': prevMsg},
              chatMessagesByDate: {
                'chat_id_1': {
                  DateTime(2022, 2, 1): ['prev_msg_id']
                }
              },
              chatInput: const ChatInput.dirty('new_message'),
              isValid: true,
            );
            toSendMsg =
                msgTempl.copyWith(chatId: 'chat_id_1', message: 'new_message');
            mockSendMessage = MockSendMessage();
            when(mockSendMessage.call(any)).thenAnswer((invocation) async {
              return toSendMsg;
            });
          },
          build: () => ChatBloc.fromParameters(
            chatUpdatesStream: mockChatUpdatesStream,
            getChats: MockGetChats(),
            getMessages: MockGetMessages(),
            sendMessage: mockSendMessage,
          ),
          seed: () => initState,
          act: (bloc) => bloc.add(ChatSendMessageRequested(
              chatId: toSendMsg.chatId, message: toSendMsg.message)),
          expect: () => [
            initState.copyWith(
              formzStatus: FormzSubmissionStatus.inProgress,
            ),
            initState.copyWith(
              lastMessageByChat: {'chat_id_1': 'prev_msg_id'},
              messagesById: {
                'prev_msg_id': prevMsg,
                toSendMsg.id: toSendMsg.copyWith(
                    uploadStatus: MessageUploadStatus.uploadInProgress),
              },
              chatMessagesByDate: {
                toSendMsg.chatId: {
                  DateTime(2022, 2, 1): [prevMsg.id],
                  DateTime(toSendMsg.sentTime.year, toSendMsg.sentTime.month,
                      toSendMsg.sentTime.day): [toSendMsg.id]
                },
              },
              isValid: false,
              chatInput: const ChatInput.pure(),
              formzStatus: FormzSubmissionStatus.success,
            ),
          ],
        );
      });
    });

    group(ChatGetChatsRequested, () {
      late MockStream<ChatUpdateStreamItem> mockChatUpdatesStream;
      late MockGetChats mockGetChats;
      late ChatState initState;

      setUp(() {
        mockChatUpdatesStream = MockStream<ChatUpdateStreamItem>();
        when(mockChatUpdatesStream.listen(any)).thenAnswer(
          (inv) =>
              const Stream<ChatUpdateStreamItem>.empty().listen((event) {}),
        );
        initState = const ChatState();
        mockGetChats = MockGetChats();
      });
      group('failure', () {
        blocTest(
          'getChats throws ChatException',
          setUp: () {
            when(mockGetChats.call(any)).thenThrow(
                const ChatException(type: ChatExceptionType.unauthenticated));
          },
          build: () => ChatBloc.fromParameters(
            chatUpdatesStream: mockChatUpdatesStream,
            getChats: mockGetChats,
            getMessages: MockGetMessages(),
            sendMessage: MockSendMessage(),
          ),
          act: (bloc) => bloc.add(const ChatGetChatsRequested()),
          verify: (bloc) {
            expect(bloc.state.chatsLoadingStatus, ChatsLoadingStatus.failed);
            expect(bloc.state.errorMessage, isNotNull);
          },
        );
      });
      group('success', () {
        blocTest(
          'state changes from initial state',
          setUp: () {
            when(mockGetChats.call(any)).thenAnswer((invocation) async {
              return chats;
            });
          },
          build: () => ChatBloc.fromParameters(
            chatUpdatesStream: mockChatUpdatesStream,
            getChats: mockGetChats,
            getMessages: MockGetMessages(),
            sendMessage: MockSendMessage(),
          ),
          act: (bloc) => bloc.add(const ChatGetChatsRequested()),
          // Skip the first state emitted that changes ust the chatsLoadingStatus
          verify: (bloc) => verify(mockGetChats.call(any)).called(1),
          expect: () => [
            initState.copyWith(
                chatsLoadingStatus: ChatsLoadingStatus.inProgress),
            initState.copyWith(
              chatsById: {for (var chat in chats) chat.id: chat},
              directMessageChats: ['chat_id_2', 'chat_id_1'],
              groupChats: ['chat_id_5', 'chat_id_4', 'chat_id_3'],
              lastDirectMessageChat: 'chat_id_1',
              lastGroupChat: 'chat_id_3',
              chatsLoadingStatus: ChatsLoadingStatus.complete,
            )
          ],
        );
      });
    });
  });
}
