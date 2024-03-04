// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatState {
// All chats loaded by Id.
  Map<String, Chat> get chatsById =>
      throw _privateConstructorUsedError; // List of direct message chats, sorted by updateTime and Id (descending).
  List<String> get directMessageChats =>
      throw _privateConstructorUsedError; // List of group chats, sorted by updateTime and Id (descending).
  List<String> get groupChats =>
      throw _privateConstructorUsedError; // The last direct message chat by updateTime and Id, i.e., the earliest
// created with the smallest Id in directMessageChats.
  String? get lastDirectMessageChat =>
      throw _privateConstructorUsedError; // The last group chat by updateTime and Id, i.e., the earliest created
// with the smallest Id in groupChats.
  String? get lastGroupChat =>
      throw _privateConstructorUsedError; // Map from Chat Id to the ID of the last message (earliest timestamp and smallest
// Id) for each chat.
  Map<String, String?> get lastMessageByChat =>
      throw _privateConstructorUsedError; // The loading status of the chats on the chat page.
  dynamic get chatsLoadingStatus =>
      throw _privateConstructorUsedError; // The loading status of the messages on the chat details page.
  dynamic get messagesLoadingStatus =>
      throw _privateConstructorUsedError; // All messagtes loaded by Id.
  Map<String, Message> get messagesById =>
      throw _privateConstructorUsedError; // Map from Chat Id to a map of dates to messages of the Chat.
// The messages Ids are sorted by sent time and ID (descending).
  Map<String, Map<DateTime, List<String>>> get chatMessagesByDate =>
      throw _privateConstructorUsedError; // The last access time of each chat during the session.
  Map<String, DateTime> get lastChatAccess =>
      throw _privateConstructorUsedError; // The chat input state.
  ChatInput get chatInput =>
      throw _privateConstructorUsedError; // The status of chat input submission.
  FormzSubmissionStatus get formzStatus =>
      throw _privateConstructorUsedError; // Whether the state of the bloc is valid for chat send submission.
  bool get isValid =>
      throw _privateConstructorUsedError; // Pending messages (message.uploadStatus == uploadInProgress) by Id for each chat.
// The first key is the Chat Id, the second is the pending messages by Id.
// @Default({}) Map<String, Map<String, Message>> pendingMessagesById,
// Error message to display after processing a ChatEvent.
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call(
      {Map<String, Chat> chatsById,
      List<String> directMessageChats,
      List<String> groupChats,
      String? lastDirectMessageChat,
      String? lastGroupChat,
      Map<String, String?> lastMessageByChat,
      dynamic chatsLoadingStatus,
      dynamic messagesLoadingStatus,
      Map<String, Message> messagesById,
      Map<String, Map<DateTime, List<String>>> chatMessagesByDate,
      Map<String, DateTime> lastChatAccess,
      ChatInput chatInput,
      FormzSubmissionStatus formzStatus,
      bool isValid,
      String? errorMessage});
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatsById = null,
    Object? directMessageChats = null,
    Object? groupChats = null,
    Object? lastDirectMessageChat = freezed,
    Object? lastGroupChat = freezed,
    Object? lastMessageByChat = null,
    Object? chatsLoadingStatus = freezed,
    Object? messagesLoadingStatus = freezed,
    Object? messagesById = null,
    Object? chatMessagesByDate = null,
    Object? lastChatAccess = null,
    Object? chatInput = null,
    Object? formzStatus = null,
    Object? isValid = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      chatsById: null == chatsById
          ? _value.chatsById
          : chatsById // ignore: cast_nullable_to_non_nullable
              as Map<String, Chat>,
      directMessageChats: null == directMessageChats
          ? _value.directMessageChats
          : directMessageChats // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupChats: null == groupChats
          ? _value.groupChats
          : groupChats // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastDirectMessageChat: freezed == lastDirectMessageChat
          ? _value.lastDirectMessageChat
          : lastDirectMessageChat // ignore: cast_nullable_to_non_nullable
              as String?,
      lastGroupChat: freezed == lastGroupChat
          ? _value.lastGroupChat
          : lastGroupChat // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageByChat: null == lastMessageByChat
          ? _value.lastMessageByChat
          : lastMessageByChat // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
      chatsLoadingStatus: freezed == chatsLoadingStatus
          ? _value.chatsLoadingStatus
          : chatsLoadingStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      messagesLoadingStatus: freezed == messagesLoadingStatus
          ? _value.messagesLoadingStatus
          : messagesLoadingStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      messagesById: null == messagesById
          ? _value.messagesById
          : messagesById // ignore: cast_nullable_to_non_nullable
              as Map<String, Message>,
      chatMessagesByDate: null == chatMessagesByDate
          ? _value.chatMessagesByDate
          : chatMessagesByDate // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<DateTime, List<String>>>,
      lastChatAccess: null == lastChatAccess
          ? _value.lastChatAccess
          : lastChatAccess // ignore: cast_nullable_to_non_nullable
              as Map<String, DateTime>,
      chatInput: null == chatInput
          ? _value.chatInput
          : chatInput // ignore: cast_nullable_to_non_nullable
              as ChatInput,
      formzStatus: null == formzStatus
          ? _value.formzStatus
          : formzStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatStateImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$ChatStateImplCopyWith(
          _$ChatStateImpl value, $Res Function(_$ChatStateImpl) then) =
      __$$ChatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, Chat> chatsById,
      List<String> directMessageChats,
      List<String> groupChats,
      String? lastDirectMessageChat,
      String? lastGroupChat,
      Map<String, String?> lastMessageByChat,
      dynamic chatsLoadingStatus,
      dynamic messagesLoadingStatus,
      Map<String, Message> messagesById,
      Map<String, Map<DateTime, List<String>>> chatMessagesByDate,
      Map<String, DateTime> lastChatAccess,
      ChatInput chatInput,
      FormzSubmissionStatus formzStatus,
      bool isValid,
      String? errorMessage});
}

/// @nodoc
class __$$ChatStateImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatStateImpl>
    implements _$$ChatStateImplCopyWith<$Res> {
  __$$ChatStateImplCopyWithImpl(
      _$ChatStateImpl _value, $Res Function(_$ChatStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatsById = null,
    Object? directMessageChats = null,
    Object? groupChats = null,
    Object? lastDirectMessageChat = freezed,
    Object? lastGroupChat = freezed,
    Object? lastMessageByChat = null,
    Object? chatsLoadingStatus = freezed,
    Object? messagesLoadingStatus = freezed,
    Object? messagesById = null,
    Object? chatMessagesByDate = null,
    Object? lastChatAccess = null,
    Object? chatInput = null,
    Object? formzStatus = null,
    Object? isValid = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$ChatStateImpl(
      chatsById: null == chatsById
          ? _value._chatsById
          : chatsById // ignore: cast_nullable_to_non_nullable
              as Map<String, Chat>,
      directMessageChats: null == directMessageChats
          ? _value._directMessageChats
          : directMessageChats // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupChats: null == groupChats
          ? _value._groupChats
          : groupChats // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastDirectMessageChat: freezed == lastDirectMessageChat
          ? _value.lastDirectMessageChat
          : lastDirectMessageChat // ignore: cast_nullable_to_non_nullable
              as String?,
      lastGroupChat: freezed == lastGroupChat
          ? _value.lastGroupChat
          : lastGroupChat // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageByChat: null == lastMessageByChat
          ? _value._lastMessageByChat
          : lastMessageByChat // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
      chatsLoadingStatus: freezed == chatsLoadingStatus
          ? _value.chatsLoadingStatus!
          : chatsLoadingStatus,
      messagesLoadingStatus: freezed == messagesLoadingStatus
          ? _value.messagesLoadingStatus!
          : messagesLoadingStatus,
      messagesById: null == messagesById
          ? _value._messagesById
          : messagesById // ignore: cast_nullable_to_non_nullable
              as Map<String, Message>,
      chatMessagesByDate: null == chatMessagesByDate
          ? _value._chatMessagesByDate
          : chatMessagesByDate // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<DateTime, List<String>>>,
      lastChatAccess: null == lastChatAccess
          ? _value._lastChatAccess
          : lastChatAccess // ignore: cast_nullable_to_non_nullable
              as Map<String, DateTime>,
      chatInput: null == chatInput
          ? _value.chatInput
          : chatInput // ignore: cast_nullable_to_non_nullable
              as ChatInput,
      formzStatus: null == formzStatus
          ? _value.formzStatus
          : formzStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChatStateImpl implements _ChatState {
  const _$ChatStateImpl(
      {final Map<String, Chat> chatsById = const {},
      final List<String> directMessageChats = const [],
      final List<String> groupChats = const [],
      this.lastDirectMessageChat,
      this.lastGroupChat,
      final Map<String, String?> lastMessageByChat = const {},
      this.chatsLoadingStatus = ChatsLoadingStatus.complete,
      this.messagesLoadingStatus = MessagesLoadingStatus.complete,
      final Map<String, Message> messagesById = const {},
      final Map<String, Map<DateTime, List<String>>> chatMessagesByDate =
          const {},
      final Map<String, DateTime> lastChatAccess = const {},
      this.chatInput = const ChatInput.pure(),
      this.formzStatus = FormzSubmissionStatus.initial,
      this.isValid = false,
      this.errorMessage})
      : _chatsById = chatsById,
        _directMessageChats = directMessageChats,
        _groupChats = groupChats,
        _lastMessageByChat = lastMessageByChat,
        _messagesById = messagesById,
        _chatMessagesByDate = chatMessagesByDate,
        _lastChatAccess = lastChatAccess;

// All chats loaded by Id.
  final Map<String, Chat> _chatsById;
// All chats loaded by Id.
  @override
  @JsonKey()
  Map<String, Chat> get chatsById {
    if (_chatsById is EqualUnmodifiableMapView) return _chatsById;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_chatsById);
  }

// List of direct message chats, sorted by updateTime and Id (descending).
  final List<String> _directMessageChats;
// List of direct message chats, sorted by updateTime and Id (descending).
  @override
  @JsonKey()
  List<String> get directMessageChats {
    if (_directMessageChats is EqualUnmodifiableListView)
      return _directMessageChats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_directMessageChats);
  }

// List of group chats, sorted by updateTime and Id (descending).
  final List<String> _groupChats;
// List of group chats, sorted by updateTime and Id (descending).
  @override
  @JsonKey()
  List<String> get groupChats {
    if (_groupChats is EqualUnmodifiableListView) return _groupChats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groupChats);
  }

// The last direct message chat by updateTime and Id, i.e., the earliest
// created with the smallest Id in directMessageChats.
  @override
  final String? lastDirectMessageChat;
// The last group chat by updateTime and Id, i.e., the earliest created
// with the smallest Id in groupChats.
  @override
  final String? lastGroupChat;
// Map from Chat Id to the ID of the last message (earliest timestamp and smallest
// Id) for each chat.
  final Map<String, String?> _lastMessageByChat;
// Map from Chat Id to the ID of the last message (earliest timestamp and smallest
// Id) for each chat.
  @override
  @JsonKey()
  Map<String, String?> get lastMessageByChat {
    if (_lastMessageByChat is EqualUnmodifiableMapView)
      return _lastMessageByChat;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_lastMessageByChat);
  }

// The loading status of the chats on the chat page.
  @override
  @JsonKey()
  final dynamic chatsLoadingStatus;
// The loading status of the messages on the chat details page.
  @override
  @JsonKey()
  final dynamic messagesLoadingStatus;
// All messagtes loaded by Id.
  final Map<String, Message> _messagesById;
// All messagtes loaded by Id.
  @override
  @JsonKey()
  Map<String, Message> get messagesById {
    if (_messagesById is EqualUnmodifiableMapView) return _messagesById;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_messagesById);
  }

// Map from Chat Id to a map of dates to messages of the Chat.
// The messages Ids are sorted by sent time and ID (descending).
  final Map<String, Map<DateTime, List<String>>> _chatMessagesByDate;
// Map from Chat Id to a map of dates to messages of the Chat.
// The messages Ids are sorted by sent time and ID (descending).
  @override
  @JsonKey()
  Map<String, Map<DateTime, List<String>>> get chatMessagesByDate {
    if (_chatMessagesByDate is EqualUnmodifiableMapView)
      return _chatMessagesByDate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_chatMessagesByDate);
  }

// The last access time of each chat during the session.
  final Map<String, DateTime> _lastChatAccess;
// The last access time of each chat during the session.
  @override
  @JsonKey()
  Map<String, DateTime> get lastChatAccess {
    if (_lastChatAccess is EqualUnmodifiableMapView) return _lastChatAccess;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_lastChatAccess);
  }

// The chat input state.
  @override
  @JsonKey()
  final ChatInput chatInput;
// The status of chat input submission.
  @override
  @JsonKey()
  final FormzSubmissionStatus formzStatus;
// Whether the state of the bloc is valid for chat send submission.
  @override
  @JsonKey()
  final bool isValid;
// Pending messages (message.uploadStatus == uploadInProgress) by Id for each chat.
// The first key is the Chat Id, the second is the pending messages by Id.
// @Default({}) Map<String, Map<String, Message>> pendingMessagesById,
// Error message to display after processing a ChatEvent.
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ChatState(chatsById: $chatsById, directMessageChats: $directMessageChats, groupChats: $groupChats, lastDirectMessageChat: $lastDirectMessageChat, lastGroupChat: $lastGroupChat, lastMessageByChat: $lastMessageByChat, chatsLoadingStatus: $chatsLoadingStatus, messagesLoadingStatus: $messagesLoadingStatus, messagesById: $messagesById, chatMessagesByDate: $chatMessagesByDate, lastChatAccess: $lastChatAccess, chatInput: $chatInput, formzStatus: $formzStatus, isValid: $isValid, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateImpl &&
            const DeepCollectionEquality()
                .equals(other._chatsById, _chatsById) &&
            const DeepCollectionEquality()
                .equals(other._directMessageChats, _directMessageChats) &&
            const DeepCollectionEquality()
                .equals(other._groupChats, _groupChats) &&
            (identical(other.lastDirectMessageChat, lastDirectMessageChat) ||
                other.lastDirectMessageChat == lastDirectMessageChat) &&
            (identical(other.lastGroupChat, lastGroupChat) ||
                other.lastGroupChat == lastGroupChat) &&
            const DeepCollectionEquality()
                .equals(other._lastMessageByChat, _lastMessageByChat) &&
            const DeepCollectionEquality()
                .equals(other.chatsLoadingStatus, chatsLoadingStatus) &&
            const DeepCollectionEquality()
                .equals(other.messagesLoadingStatus, messagesLoadingStatus) &&
            const DeepCollectionEquality()
                .equals(other._messagesById, _messagesById) &&
            const DeepCollectionEquality()
                .equals(other._chatMessagesByDate, _chatMessagesByDate) &&
            const DeepCollectionEquality()
                .equals(other._lastChatAccess, _lastChatAccess) &&
            (identical(other.chatInput, chatInput) ||
                other.chatInput == chatInput) &&
            (identical(other.formzStatus, formzStatus) ||
                other.formzStatus == formzStatus) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_chatsById),
      const DeepCollectionEquality().hash(_directMessageChats),
      const DeepCollectionEquality().hash(_groupChats),
      lastDirectMessageChat,
      lastGroupChat,
      const DeepCollectionEquality().hash(_lastMessageByChat),
      const DeepCollectionEquality().hash(chatsLoadingStatus),
      const DeepCollectionEquality().hash(messagesLoadingStatus),
      const DeepCollectionEquality().hash(_messagesById),
      const DeepCollectionEquality().hash(_chatMessagesByDate),
      const DeepCollectionEquality().hash(_lastChatAccess),
      chatInput,
      formzStatus,
      isValid,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      __$$ChatStateImplCopyWithImpl<_$ChatStateImpl>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  const factory _ChatState(
      {final Map<String, Chat> chatsById,
      final List<String> directMessageChats,
      final List<String> groupChats,
      final String? lastDirectMessageChat,
      final String? lastGroupChat,
      final Map<String, String?> lastMessageByChat,
      final dynamic chatsLoadingStatus,
      final dynamic messagesLoadingStatus,
      final Map<String, Message> messagesById,
      final Map<String, Map<DateTime, List<String>>> chatMessagesByDate,
      final Map<String, DateTime> lastChatAccess,
      final ChatInput chatInput,
      final FormzSubmissionStatus formzStatus,
      final bool isValid,
      final String? errorMessage}) = _$ChatStateImpl;

  @override // All chats loaded by Id.
  Map<String, Chat> get chatsById;
  @override // List of direct message chats, sorted by updateTime and Id (descending).
  List<String> get directMessageChats;
  @override // List of group chats, sorted by updateTime and Id (descending).
  List<String> get groupChats;
  @override // The last direct message chat by updateTime and Id, i.e., the earliest
// created with the smallest Id in directMessageChats.
  String? get lastDirectMessageChat;
  @override // The last group chat by updateTime and Id, i.e., the earliest created
// with the smallest Id in groupChats.
  String? get lastGroupChat;
  @override // Map from Chat Id to the ID of the last message (earliest timestamp and smallest
// Id) for each chat.
  Map<String, String?> get lastMessageByChat;
  @override // The loading status of the chats on the chat page.
  dynamic get chatsLoadingStatus;
  @override // The loading status of the messages on the chat details page.
  dynamic get messagesLoadingStatus;
  @override // All messagtes loaded by Id.
  Map<String, Message> get messagesById;
  @override // Map from Chat Id to a map of dates to messages of the Chat.
// The messages Ids are sorted by sent time and ID (descending).
  Map<String, Map<DateTime, List<String>>> get chatMessagesByDate;
  @override // The last access time of each chat during the session.
  Map<String, DateTime> get lastChatAccess;
  @override // The chat input state.
  ChatInput get chatInput;
  @override // The status of chat input submission.
  FormzSubmissionStatus get formzStatus;
  @override // Whether the state of the bloc is valid for chat send submission.
  bool get isValid;
  @override // Pending messages (message.uploadStatus == uploadInProgress) by Id for each chat.
// The first key is the Chat Id, the second is the pending messages by Id.
// @Default({}) Map<String, Map<String, Message>> pendingMessagesById,
// Error message to display after processing a ChatEvent.
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
