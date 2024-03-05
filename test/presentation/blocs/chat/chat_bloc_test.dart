import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:teams/core/exceptions/chat_exception.dart';
import 'package:teams/domain/entities/chat.dart';
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

    group(ChatGetChatsRequested, () {
      late MockStream<ChatUpdateStreamItem> mockChatUpdatesStream;
      late MockGetChats mockGetChats;
      late ChatState initState;
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
