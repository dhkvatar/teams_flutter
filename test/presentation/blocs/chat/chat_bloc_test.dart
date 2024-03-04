import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:teams/domain/repositories/chat_repository.dart';
import 'package:teams/domain/usecases/chat/get_chats.dart';
import 'package:teams/domain/usecases/chat/get_messages.dart';
import 'package:teams/domain/usecases/chat/send_message.dart';
// import 'package:teams/domain/usecases/chat/get_chat_updates_stream.dart';
import 'package:teams/presentation/blocs/chat/chat_bloc.dart';
// import 'package:teams/presentation/blocs/chat/chat_event.dart';
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

    //   group(ChatGetChatsRequested, () {
    //     late MockStream<ChatUpdateStreamItem> mockStream;
    //     blocTest(
    //       'emits ChatsLoadingStatus.inProgress first',
    //       setUp: () {
    //         mockStream = MockStream<ChatUpdateStreamItem>();
    //         when(mockStream.listen(any)).thenAnswer(
    //           (inv) =>
    //               const Stream<ChatUpdateStreamItem>.empty().listen((event) {}),
    //         );
    //       },
    //       build: () => ChatBloc.fromStream(stream: mockStream),
    //       act: (bloc) => bloc.add(const ChatGetChatsRequested()),
    //       expect: () => [
    //         const ChatState(),
    //         const ChatState()
    //             .copyWith(chatsLoadingStatus: ChatsLoadingStatus.inProgress),
    //       ],
    //     );
    //   });
    // });
  });
}
