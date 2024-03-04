import 'dart:async';

// import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:teams/domain/repositories/chat_repository.dart';
// import 'package:teams/domain/usecases/chat/get_chat_updates_stream.dart';
import 'package:teams/presentation/blocs/chat/chat_bloc.dart';
// import 'package:teams/presentation/blocs/chat/chat_event.dart';
import 'package:teams/presentation/blocs/chat/chat_state.dart';

import 'chat_bloc_test.mocks.dart';

@GenerateMocks([Stream])
void main() {
  group(ChatBloc, () {
    group('initialization', () {
      test('state is default ChatState', () {
        MockStream<ChatUpdateStreamItem> mockChatUpdatesStream =
            MockStream<ChatUpdateStreamItem>();
        when(mockChatUpdatesStream.listen(any)).thenAnswer(
          (inv) =>
              const Stream<ChatUpdateStreamItem>.empty().listen((event) {}),
        );
        final ChatBloc chatBloc =
            ChatBloc.fromStream(stream: mockChatUpdatesStream);
        expect(chatBloc.state, const ChatState());
      });
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
