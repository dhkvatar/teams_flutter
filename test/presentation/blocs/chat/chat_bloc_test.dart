// import 'dart:async';

// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:formz/formz.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:teams/core/exceptions/chat_exception.dart';
// import 'package:teams/core/forms/chat.dart';
// import 'package:teams/domain/entities/chat.dart';
// import 'package:teams/domain/entities/message.dart';
// import 'package:teams/domain/repositories/chat_repository.dart';
// import 'package:teams/domain/usecases/chat/get_chats.dart';
// import 'package:teams/domain/usecases/chat/get_messages.dart';
// import 'package:teams/domain/usecases/chat/send_message.dart';
// import 'package:teams/presentation/blocs/chat/chat_bloc.dart';
// import 'package:teams/presentation/blocs/chat/chat_event.dart';
// import 'package:teams/presentation/blocs/chat/chat_state.dart';

void main() {}
// @GenerateNiceMocks([
//   MockSpec<Stream>(),
//   MockSpec<GetChats>(),
//   MockSpec<GetMessages>(),
//   MockSpec<SendMessage>(),
// ])
// import 'chat_bloc_test.mocks.dart';

// List<Chat> chats = [
//   Chat(
//       id: 'chat_id_1',
//       userIds: ['user_id_1', 'user_id_2'],
//       name: 'test_chat_1',
//       createTime: DateTime(2022, 2, 1),
//       updateTime: DateTime(2022, 2, 1),
//       isGroupChat: false),
//   Chat(
//       id: 'chat_id_2',
//       userIds: ['user_id_1', 'user_id_2'],
//       name: 'test_chat_2',
//       createTime: DateTime(2022, 2, 1),
//       updateTime: DateTime(2022, 2, 1),
//       isGroupChat: false),
//   Chat(
//     id: 'chat_id_3',
//     userIds: ['user_id_1', 'user_id_2', 'user_id_3'],
//     name: 'test_chat_3',
//     createTime: DateTime(2022, 2, 2),
//     updateTime: DateTime(2022, 2, 2),
//     isGroupChat: true,
//   ),
//   Chat(
//     id: 'chat_id_4',
//     userIds: ['user_id_1', 'user_id_2', 'user_id_3'],
//     name: 'test_chat_4',
//     createTime: DateTime(2022, 2, 2),
//     updateTime: DateTime(2022, 2, 2),
//     isGroupChat: true,
//   ),
//   Chat(
//     id: 'chat_id_5',
//     userIds: ['user_id_1', 'user_id_2', 'user_id_3'],
//     name: 'test_chat_5',
//     createTime: DateTime(2022, 2, 3),
//     updateTime: DateTime(2022, 2, 3),
//     isGroupChat: true,
//   ),
// ];

// void main() {
//   group(ChatBloc, () {
//     late MockStream<ChatUpdateStreamItem> mockChatUpdatesStream;
//     setUp(() {
//       mockChatUpdatesStream = MockStream<ChatUpdateStreamItem>();
//       when(mockChatUpdatesStream.listen(any)).thenAnswer(
//         (inv) => const Stream<ChatUpdateStreamItem>.empty().listen((event) {}),
//       );
//     });

//     group('initialization', () {
//       blocTest(
//         'state is default ChatState',
//         build: () => ChatBloc.fromParameters(
//           chatUpdatesStream: mockChatUpdatesStream,
//           getChats: MockGetChats(),
//           getMessages: MockGetMessages(),
//           sendMessage: MockSendMessage(),
//         ),
//         verify: (bloc) => expect(bloc.state, const ChatState()),
//       );
//     });

//     group(ChatGetMessagesRequested, () {
//       late MockGetMessages mockGetMessages;
//       late ChatState seedState;
//       final chat = Chat(
//           id: 'chat_id_1',
//           userIds: ['user_id_1', 'user_id_2'],
//           name: 'Chat1',
//           createTime: DateTime(2022, 2, 1),
//           updateTime: DateTime(2022, 2, 2),
//           isGroupChat: false);
//       final msg1 = Message(
//           id: 'msg_id_1',
//           senderId: 'user_id_1',
//           chatId: 'chat_id_1',
//           message: 'message_1',
//           sentTime: DateTime(2022, 2, 2, 1));
//       final msg2 = Message(
//           id: 'msg_id_2',
//           senderId: 'user_id_1',
//           chatId: 'chat_id_1',
//           message: 'message_2',
//           sentTime: DateTime(2022, 2, 2, 2));
//       final msg3 = Message(
//           id: 'msg_id_3',
//           senderId: 'user_id_1',
//           chatId: 'chat_id_1',
//           message: 'message_3',
//           sentTime: DateTime(2022, 2, 1, 1));
//       final msg4 = Message(
//           id: 'msg_id_4',
//           senderId: 'user_id_1',
//           chatId: 'chat_id_1',
//           message: 'message_4',
//           sentTime: DateTime(2022, 2, 1, 2));

//       group('success', () {
//         blocTest(
//           'state changes from init state with no messages loaded',
//           setUp: () {
//             mockGetMessages = MockGetMessages();
//             when(mockGetMessages.call(any))
//                 .thenAnswer((realInvocation) async => [msg2, msg1]);
//             seedState = ChatState(
//               chatsById: {'chat_id_1': chat},
//               directMessageChats: ['chat_id_1'],
//             );
//           },
//           build: () => ChatBloc.fromParameters(
//             chatUpdatesStream: mockChatUpdatesStream,
//             getChats: MockGetChats(),
//             getMessages: mockGetMessages,
//             sendMessage: MockSendMessage(),
//           ),
//           seed: () => seedState,
//           act: (bloc) => bloc.add(
//             const ChatGetMessagesRequested(chatId: 'chat_id_1'),
//           ),
//           verify: (bloc) {
//             expect(
//                 bloc.state.messagesById, {'msg_id_2': msg2, 'msg_id_1': msg1});
//             expect(bloc.state.chatMessagesByDateTime, {
//               'chat_id_1': {
//                 DateTime(2022, 2, 2, 1): ['msg_id_1'],
//                 DateTime(2022, 2, 2, 2): ['msg_id_2']
//               }
//             });
//             expect(bloc.state.lastChatAccess['chat_id_1'], isNotNull);
//             expect(bloc.state.messagesLoadingStatus,
//                 MessagesLoadingStatus.complete);
//             expect(bloc.state.lastMessageByChat, {'chat_id_1': 'msg_id_1'});
//           },
//         );
//         blocTest(
//           'state changes from init state with existing messages loaded',
//           setUp: () {
//             mockGetMessages = MockGetMessages();
//             when(mockGetMessages.call(any))
//                 .thenAnswer((realInvocation) async => [msg2, msg1]);
//             seedState = ChatState(
//               chatsById: {'chat_id_1': chat},
//               directMessageChats: ['chat_id_1'],
//               lastMessageByChat: {'chat_id_1': 'msg_id_3'},
//               messagesById: {'msg_id_3': msg3, 'msg_id_4': msg4},
//               chatMessagesByDateTime: {
//                 'chat_id_1': {
//                   DateTime(2022, 2, 1): ['msg_id_3', 'msg_id_4'],
//                 },
//               },
//               lastChatAccess: {'chat_id_1': DateTime(2022, 2, 1)},
//             );
//           },
//           build: () => ChatBloc.fromParameters(
//             chatUpdatesStream: mockChatUpdatesStream,
//             getChats: MockGetChats(),
//             getMessages: mockGetMessages,
//             sendMessage: MockSendMessage(),
//           ),
//           seed: () => seedState,
//           act: (bloc) => bloc.add(
//             const ChatGetMessagesRequested(chatId: 'chat_id_1'),
//           ),
//           verify: (bloc) {
//             expect(bloc.state.messagesById, {
//               'msg_id_3': msg3,
//               'msg_id_4': msg4,
//               'msg_id_2': msg2,
//               'msg_id_1': msg1
//             });
//             expect(bloc.state.chatMessagesByDateTime, {
//               'chat_id_1': {
//                 DateTime(2022, 2, 1, 1): ['msg_id_3'],
//                 DateTime(2022, 2, 1, 2): ['msg_id_4'],
//                 DateTime(2022, 2, 2, 1): ['msg_id_1'],
//                 DateTime(2022, 2, 2, 2): ['msg_id_2'],
//               }
//             });
//             expect(bloc.state.lastChatAccess['chat_id_1'], isNotNull);
//             expect(bloc.state.messagesLoadingStatus,
//                 MessagesLoadingStatus.complete);
//             expect(bloc.state.lastMessageByChat, {'chat_id_1': 'msg_id_3'});
//           },
//         );
//       });
//       group('failure', () {
//         blocTest(
//           'GetMessages ChatException state changes',
//           setUp: () {
//             mockGetMessages = MockGetMessages();
//             when(mockGetMessages.call(any)).thenThrow(
//                 const ChatException(type: ChatExceptionType.unauthenticated));
//             seedState = ChatState(
//               chatsById: {'chat_id_1': chat},
//               directMessageChats: ['chat_id_1'],
//             );
//           },
//           build: () => ChatBloc.fromParameters(
//             chatUpdatesStream: mockChatUpdatesStream,
//             getChats: MockGetChats(),
//             getMessages: mockGetMessages,
//             sendMessage: MockSendMessage(),
//           ),
//           seed: () => seedState,
//           act: (bloc) =>
//               bloc.add(const ChatGetMessagesRequested(chatId: 'chat_id_1')),
//           verify: (bloc) {
//             expect(
//                 bloc.state.messagesLoadingStatus, MessagesLoadingStatus.failed);
//             expect(bloc.state.errorMessage, isNotNull);
//           },
//         );
//       });
//     });

//     group(ChatSendMessageRequested, () {
//       late MockSendMessage mockSendMessage;
//       late ChatState seedState;
//       final chat = Chat(
//         id: 'chat_id_1',
//         userIds: ['user_id_1', 'user_id_2'],
//         name: 'Chat1',
//         createTime: DateTime(2022, 2, 1),
//         updateTime: DateTime(2022, 2, 2),
//         isGroupChat: false,
//       );
//       final msgTempl = Message(
//         id: 'msg_id_1',
//         chatId: '',
//         senderId: 'user_id_1',
//         message: '',
//         sentTime: DateTime(2022, 2, 2),
//       );
//       // The new message that will be sent.
//       late Message toSendMsg, prevMsg;

//       group('failure', () {
//         blocTest(
//           'SendMessage ChatException state changes',
//           setUp: () {
//             seedState = ChatState(
//               chatsById: {'chat_id_1': chat},
//               directMessageChats: ['chat_id_1'],
//               chatInput: const ChatInput.dirty('new_message'),
//               isValid: true,
//             );
//             toSendMsg =
//                 msgTempl.copyWith(chatId: 'chat_id_1', message: 'new_message');
//             mockSendMessage = MockSendMessage();
//             when(mockSendMessage.call(any)).thenAnswer((invocation) async {
//               throw const ChatException(
//                   type: ChatExceptionType.unauthenticated);
//             });
//           },
//           build: () => ChatBloc.fromParameters(
//               chatUpdatesStream: mockChatUpdatesStream,
//               getChats: MockGetChats(),
//               getMessages: MockGetMessages(),
//               sendMessage: mockSendMessage),
//           seed: () => seedState,
//           act: (bloc) => bloc.add(const ChatSendMessageRequested(
//               chatId: 'chat_id_1', message: 'new_message')),
//           verify: (bloc) {
//             expect(bloc.state.formzStatus, FormzSubmissionStatus.failure);
//             expect(bloc.state.chatInput, const ChatInput.pure());
//             expect(bloc.state.isValid, false);
//             expect(bloc.state.errorMessage, isNotNull);
//           },
//         );
//       });
//       group('success', () {
//         blocTest(
//           'state changes from initial state with chat created previously but no messages',
//           setUp: () {
//             // The init state assumes the user is part of 'chat_id_1' without
//             // any previous messages.
//             seedState = ChatState(
//               chatsById: {'chat_id_1': chat},
//               directMessageChats: ['chat_id_1'],
//               chatInput: const ChatInput.dirty('new_message'),
//               isValid: true,
//             );
//             toSendMsg =
//                 msgTempl.copyWith(chatId: 'chat_id_1', message: 'new_message');
//             mockSendMessage = MockSendMessage();
//             when(mockSendMessage.call(any)).thenAnswer((invocation) async {
//               return toSendMsg;
//             });
//           },
//           build: () => ChatBloc.fromParameters(
//             chatUpdatesStream: mockChatUpdatesStream,
//             getChats: MockGetChats(),
//             getMessages: MockGetMessages(),
//             sendMessage: mockSendMessage,
//           ),
//           seed: () => seedState,
//           act: (bloc) => bloc.add(ChatSendMessageRequested(
//               chatId: toSendMsg.chatId, message: toSendMsg.message)),
//           expect: () => [
//             seedState.copyWith(
//               formzStatus: FormzSubmissionStatus.inProgress,
//             ),
//             seedState.copyWith(
//               lastMessageByChat: {toSendMsg.chatId: toSendMsg.id},
//               messagesById: {
//                 toSendMsg.id: toSendMsg.copyWith(
//                     uploadStatus: MessageUploadStatus.uploadInProgress),
//               },
//               chatMessagesByDateTime: {
//                 toSendMsg.chatId: {
//                   DateTime(toSendMsg.sentTime.year, toSendMsg.sentTime.month,
//                       toSendMsg.sentTime.day): [toSendMsg.id]
//                 },
//               },
//               isValid: false,
//               chatInput: const ChatInput.pure(),
//               formzStatus: FormzSubmissionStatus.success,
//             ),
//           ],
//         );
//         blocTest(
//           'state changes from initial state with chat and messages previously created',
//           setUp: () {
//             prevMsg = Message(
//               id: 'prev_msg_id',
//               senderId: 'user_id_1',
//               chatId: 'chat_id_1',
//               message: 'previous message',
//               sentTime: DateTime(2022, 2, 1),
//             );
//             seedState = ChatState(
//               chatsById: {'chat_id_1': chat},
//               directMessageChats: ['chat_id_1'],
//               lastMessageByChat: {'chat_id_1': 'prev_msg_id'},
//               messagesById: {'prev_msg_id': prevMsg},
//               chatMessagesByDateTime: {
//                 'chat_id_1': {
//                   DateTime(2022, 2, 1): ['prev_msg_id']
//                 }
//               },
//               chatInput: const ChatInput.dirty('new_message'),
//               isValid: true,
//             );
//             toSendMsg =
//                 msgTempl.copyWith(chatId: 'chat_id_1', message: 'new_message');
//             mockSendMessage = MockSendMessage();
//             when(mockSendMessage.call(any)).thenAnswer((invocation) async {
//               return toSendMsg;
//             });
//           },
//           build: () => ChatBloc.fromParameters(
//             chatUpdatesStream: mockChatUpdatesStream,
//             getChats: MockGetChats(),
//             getMessages: MockGetMessages(),
//             sendMessage: mockSendMessage,
//           ),
//           seed: () => seedState,
//           act: (bloc) => bloc.add(ChatSendMessageRequested(
//               chatId: toSendMsg.chatId, message: toSendMsg.message)),
//           expect: () => [
//             seedState.copyWith(
//               formzStatus: FormzSubmissionStatus.inProgress,
//             ),
//             seedState.copyWith(
//               lastMessageByChat: {'chat_id_1': 'prev_msg_id'},
//               messagesById: {
//                 'prev_msg_id': prevMsg,
//                 toSendMsg.id: toSendMsg.copyWith(
//                     uploadStatus: MessageUploadStatus.uploadInProgress),
//               },
//               chatMessagesByDateTime: {
//                 toSendMsg.chatId: {
//                   DateTime(2022, 2, 1): [prevMsg.id],
//                   DateTime(toSendMsg.sentTime.year, toSendMsg.sentTime.month,
//                       toSendMsg.sentTime.day): [toSendMsg.id]
//                 },
//               },
//               isValid: false,
//               chatInput: const ChatInput.pure(),
//               formzStatus: FormzSubmissionStatus.success,
//             ),
//           ],
//         );
//       });
//     });

//     group(ChatUpdateStreamReceived, () {
//       const updateSuccess = ChatUpdateStreamItem(
//         chatId: 'chat_id_1',
//         updateType: ChatUpdateType.newMessageUploadSuccess,
//         newMessageId: 'msg_id_1',
//       );
//       const updateFailure = ChatUpdateStreamItem(
//         chatId: 'chat_id_1',
//         updateType: ChatUpdateType.newMessageUploadFailure,
//         newMessageId: 'msg_id_1',
//       );
//       final msg = Message(
//         id: 'msg_id_1',
//         senderId: 'user_id_1',
//         chatId: 'chat_id_1',
//         message: 'message',
//         sentTime: DateTime(2022, 2, 2),
//         uploadStatus: MessageUploadStatus.uploadInProgress,
//       );

//       late ChatState seedState;

//       group(ChatUpdateType.newMessageUploadSuccess, () {
//         blocTest(
//           'status changes',
//           setUp: () {
//             seedState = ChatState(messagesById: {'msg_id_1': msg});
//           },
//           build: () => ChatBloc.fromParameters(
//             chatUpdatesStream: mockChatUpdatesStream,
//             getChats: MockGetChats(),
//             getMessages: MockGetMessages(),
//             sendMessage: MockSendMessage(),
//           ),
//           seed: () => seedState,
//           act: (bloc) =>
//               bloc.add(const ChatUpdateStreamReceived(update: updateSuccess)),
//           expect: () => [
//             seedState.copyWith(messagesById: {
//               'msg_id_1':
//                   msg.copyWith(uploadStatus: MessageUploadStatus.success)
//             })
//           ],
//         );
//       });
//       group(ChatUpdateType.newMessageUploadFailure, () {
//         blocTest(
//           'status changes',
//           setUp: () {
//             seedState = ChatState(messagesById: {'msg_id_1': msg});
//           },
//           build: () => ChatBloc.fromParameters(
//             chatUpdatesStream: mockChatUpdatesStream,
//             getChats: MockGetChats(),
//             getMessages: MockGetMessages(),
//             sendMessage: MockSendMessage(),
//           ),
//           seed: () => seedState,
//           act: (bloc) =>
//               bloc.add(const ChatUpdateStreamReceived(update: updateFailure)),
//           expect: () => [
//             seedState.copyWith(messagesById: {
//               'msg_id_1':
//                   msg.copyWith(uploadStatus: MessageUploadStatus.timeout)
//             })
//           ],
//         );
//       });
//     });

//     group(ChatGetChatsRequested, () {
//       late MockGetChats mockGetChats;
//       late ChatState seedState;

//       setUp(() {
//         seedState = const ChatState();
//         mockGetChats = MockGetChats();
//       });
//       group('failure', () {
//         blocTest(
//           'getChats throws ChatException',
//           setUp: () {
//             when(mockGetChats.call(any)).thenThrow(
//                 const ChatException(type: ChatExceptionType.unauthenticated));
//           },
//           build: () => ChatBloc.fromParameters(
//             chatUpdatesStream: mockChatUpdatesStream,
//             getChats: mockGetChats,
//             getMessages: MockGetMessages(),
//             sendMessage: MockSendMessage(),
//           ),
//           act: (bloc) =>
//               bloc.add(const ChatGetChatsRequested(groupChats: false)),
//           verify: (bloc) {
//             expect(bloc.state.chatsLoadingStatus, ChatsLoadingStatus.failed);
//             expect(bloc.state.errorMessage, isNotNull);
//           },
//         );
//       });
//       group('success', () {
//         blocTest(
//           'state changes from initial state',
//           setUp: () {
//             when(mockGetChats.call(any)).thenAnswer((invocation) async {
//               return chats;
//             });
//           },
//           build: () => ChatBloc.fromParameters(
//             chatUpdatesStream: mockChatUpdatesStream,
//             getChats: mockGetChats,
//             getMessages: MockGetMessages(),
//             sendMessage: MockSendMessage(),
//           ),
//           act: (bloc) =>
//               bloc.add(const ChatGetChatsRequested(groupChats: false)),
//           // Skip the first state emitted that changes ust the chatsLoadingStatus
//           verify: (bloc) => verify(mockGetChats.call(any)).called(1),
//           expect: () => [
//             seedState.copyWith(
//                 chatsLoadingStatus: ChatsLoadingStatus.inProgress),
//             seedState.copyWith(
//               chatsById: {for (var chat in chats) chat.id: chat},
//               directMessageChats: ['chat_id_2', 'chat_id_1'],
//               groupChats: ['chat_id_5', 'chat_id_4', 'chat_id_3'],
//               chatsLoadingStatus: ChatsLoadingStatus.complete,
//             )
//           ],
//         );
//       });
//     });
//   });
// }
