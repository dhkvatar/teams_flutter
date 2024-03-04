import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/core/configs/app_config.dart';
import 'package:teams/presentation/blocs/chat/chat_bloc.dart';
import 'package:teams/presentation/blocs/chat/chat_event.dart';
import 'package:teams/presentation/blocs/chat/chat_state.dart';

void main() {
  setUpAll(() {
    AppConfig.isTest = true;
    configureDependencies('dev');
  });
  group(ChatBloc, () {
    late ChatBloc chatBloc;

    setUp(() {
      chatBloc = ChatBloc();
    });

    group('initialization', () {
      test('initial state is default ChatState', () {
        expect(chatBloc.state, const ChatState());
      });

      blocTest(
        '',
        build: () => chatBloc,
        act: (bloc) => bloc.add(const ChatGetChatsRequested()),
        expect: () => [const ChatState()],
      );
    });
  });
}
