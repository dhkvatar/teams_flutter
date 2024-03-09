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
      throw _privateConstructorUsedError; // Map from Chat Id to the ID of the last message (earliest timestamp and smallest
// Id) for each chat.
  Map<String, String?> get lastMessageByChat =>
      throw _privateConstructorUsedError; // The loading status of the messages on the chat details page.
  dynamic get messagesLoadingStatus =>
      throw _privateConstructorUsedError; // All messagtes loaded by Id.
  Map<String, Message> get messagesById =>
      throw _privateConstructorUsedError; // Map from Chat Id to a map of dates to messages of the Chat.
// The messages Ids are sorted by sent time and ID (descending).
  Map<String, Map<DateTime, List<String>>> get chatMessagesByDateTime =>
      throw _privateConstructorUsedError; // The last access time of each chat during the session.
  Map<String, DateTime?> get lastChatAccess =>
      throw _privateConstructorUsedError; // The chat input state.
  ChatInput get chatInput =>
      throw _privateConstructorUsedError; // The status of chat input submission.
  FormzSubmissionStatus get formzStatus =>
      throw _privateConstructorUsedError; // Whether the state of the bloc is valid for chat send submission.
  bool get isValid =>
      throw _privateConstructorUsedError; // Error message to display after processing a ChatEvent.
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
      Map<String, String?> lastMessageByChat,
      dynamic messagesLoadingStatus,
      Map<String, Message> messagesById,
      Map<String, Map<DateTime, List<String>>> chatMessagesByDateTime,
      Map<String, DateTime?> lastChatAccess,
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
    Object? lastMessageByChat = null,
    Object? messagesLoadingStatus = freezed,
    Object? messagesById = null,
    Object? chatMessagesByDateTime = null,
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
      lastMessageByChat: null == lastMessageByChat
          ? _value.lastMessageByChat
          : lastMessageByChat // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
      messagesLoadingStatus: freezed == messagesLoadingStatus
          ? _value.messagesLoadingStatus
          : messagesLoadingStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      messagesById: null == messagesById
          ? _value.messagesById
          : messagesById // ignore: cast_nullable_to_non_nullable
              as Map<String, Message>,
      chatMessagesByDateTime: null == chatMessagesByDateTime
          ? _value.chatMessagesByDateTime
          : chatMessagesByDateTime // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<DateTime, List<String>>>,
      lastChatAccess: null == lastChatAccess
          ? _value.lastChatAccess
          : lastChatAccess // ignore: cast_nullable_to_non_nullable
              as Map<String, DateTime?>,
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
      Map<String, String?> lastMessageByChat,
      dynamic messagesLoadingStatus,
      Map<String, Message> messagesById,
      Map<String, Map<DateTime, List<String>>> chatMessagesByDateTime,
      Map<String, DateTime?> lastChatAccess,
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
    Object? lastMessageByChat = null,
    Object? messagesLoadingStatus = freezed,
    Object? messagesById = null,
    Object? chatMessagesByDateTime = null,
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
      lastMessageByChat: null == lastMessageByChat
          ? _value._lastMessageByChat
          : lastMessageByChat // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
      messagesLoadingStatus: freezed == messagesLoadingStatus
          ? _value.messagesLoadingStatus!
          : messagesLoadingStatus,
      messagesById: null == messagesById
          ? _value._messagesById
          : messagesById // ignore: cast_nullable_to_non_nullable
              as Map<String, Message>,
      chatMessagesByDateTime: null == chatMessagesByDateTime
          ? _value._chatMessagesByDateTime
          : chatMessagesByDateTime // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<DateTime, List<String>>>,
      lastChatAccess: null == lastChatAccess
          ? _value._lastChatAccess
          : lastChatAccess // ignore: cast_nullable_to_non_nullable
              as Map<String, DateTime?>,
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
      final Map<String, String?> lastMessageByChat = const {},
      this.messagesLoadingStatus = MessagesLoadingStatus.complete,
      final Map<String, Message> messagesById = const {},
      final Map<String, Map<DateTime, List<String>>> chatMessagesByDateTime =
          const {},
      final Map<String, DateTime?> lastChatAccess = const {},
      this.chatInput = const ChatInput.pure(),
      this.formzStatus = FormzSubmissionStatus.initial,
      this.isValid = false,
      this.errorMessage})
      : _chatsById = chatsById,
        _lastMessageByChat = lastMessageByChat,
        _messagesById = messagesById,
        _chatMessagesByDateTime = chatMessagesByDateTime,
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
  final Map<String, Map<DateTime, List<String>>> _chatMessagesByDateTime;
// Map from Chat Id to a map of dates to messages of the Chat.
// The messages Ids are sorted by sent time and ID (descending).
  @override
  @JsonKey()
  Map<String, Map<DateTime, List<String>>> get chatMessagesByDateTime {
    if (_chatMessagesByDateTime is EqualUnmodifiableMapView)
      return _chatMessagesByDateTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_chatMessagesByDateTime);
  }

// The last access time of each chat during the session.
  final Map<String, DateTime?> _lastChatAccess;
// The last access time of each chat during the session.
  @override
  @JsonKey()
  Map<String, DateTime?> get lastChatAccess {
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
// Error message to display after processing a ChatEvent.
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ChatState(chatsById: $chatsById, lastMessageByChat: $lastMessageByChat, messagesLoadingStatus: $messagesLoadingStatus, messagesById: $messagesById, chatMessagesByDateTime: $chatMessagesByDateTime, lastChatAccess: $lastChatAccess, chatInput: $chatInput, formzStatus: $formzStatus, isValid: $isValid, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateImpl &&
            const DeepCollectionEquality()
                .equals(other._chatsById, _chatsById) &&
            const DeepCollectionEquality()
                .equals(other._lastMessageByChat, _lastMessageByChat) &&
            const DeepCollectionEquality()
                .equals(other.messagesLoadingStatus, messagesLoadingStatus) &&
            const DeepCollectionEquality()
                .equals(other._messagesById, _messagesById) &&
            const DeepCollectionEquality().equals(
                other._chatMessagesByDateTime, _chatMessagesByDateTime) &&
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
      const DeepCollectionEquality().hash(_lastMessageByChat),
      const DeepCollectionEquality().hash(messagesLoadingStatus),
      const DeepCollectionEquality().hash(_messagesById),
      const DeepCollectionEquality().hash(_chatMessagesByDateTime),
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
      final Map<String, String?> lastMessageByChat,
      final dynamic messagesLoadingStatus,
      final Map<String, Message> messagesById,
      final Map<String, Map<DateTime, List<String>>> chatMessagesByDateTime,
      final Map<String, DateTime?> lastChatAccess,
      final ChatInput chatInput,
      final FormzSubmissionStatus formzStatus,
      final bool isValid,
      final String? errorMessage}) = _$ChatStateImpl;

  @override // All chats loaded by Id.
  Map<String, Chat> get chatsById;
  @override // Map from Chat Id to the ID of the last message (earliest timestamp and smallest
// Id) for each chat.
  Map<String, String?> get lastMessageByChat;
  @override // The loading status of the messages on the chat details page.
  dynamic get messagesLoadingStatus;
  @override // All messagtes loaded by Id.
  Map<String, Message> get messagesById;
  @override // Map from Chat Id to a map of dates to messages of the Chat.
// The messages Ids are sorted by sent time and ID (descending).
  Map<String, Map<DateTime, List<String>>> get chatMessagesByDateTime;
  @override // The last access time of each chat during the session.
  Map<String, DateTime?> get lastChatAccess;
  @override // The chat input state.
  ChatInput get chatInput;
  @override // The status of chat input submission.
  FormzSubmissionStatus get formzStatus;
  @override // Whether the state of the bloc is valid for chat send submission.
  bool get isValid;
  @override // Error message to display after processing a ChatEvent.
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatsPagingState {
// The DM chat with the oldest updateTime that's currently loaded.
  String? get oldestDirectChatId =>
      throw _privateConstructorUsedError; // The update time of the oldest direct message chat.
  DateTime? get oldestDirectChatUpdateTime =>
      throw _privateConstructorUsedError; // The group chat with the oldest updateTime that's currently loaded.
  String? get oldestGroupChatId =>
      throw _privateConstructorUsedError; // The update time of the oldest group chat.
  DateTime? get oldestGroupChatDateTime =>
      throw _privateConstructorUsedError; // Whether the current oldestDirectChatId is the oldest direct chat.
  bool get isOldestDirectChat =>
      throw _privateConstructorUsedError; // Whether the current oldestGroupChatId is the oldest group chat.
  bool get isOldestGroupChat => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatsPagingStateCopyWith<ChatsPagingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatsPagingStateCopyWith<$Res> {
  factory $ChatsPagingStateCopyWith(
          ChatsPagingState value, $Res Function(ChatsPagingState) then) =
      _$ChatsPagingStateCopyWithImpl<$Res, ChatsPagingState>;
  @useResult
  $Res call(
      {String? oldestDirectChatId,
      DateTime? oldestDirectChatUpdateTime,
      String? oldestGroupChatId,
      DateTime? oldestGroupChatDateTime,
      bool isOldestDirectChat,
      bool isOldestGroupChat});
}

/// @nodoc
class _$ChatsPagingStateCopyWithImpl<$Res, $Val extends ChatsPagingState>
    implements $ChatsPagingStateCopyWith<$Res> {
  _$ChatsPagingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldestDirectChatId = freezed,
    Object? oldestDirectChatUpdateTime = freezed,
    Object? oldestGroupChatId = freezed,
    Object? oldestGroupChatDateTime = freezed,
    Object? isOldestDirectChat = null,
    Object? isOldestGroupChat = null,
  }) {
    return _then(_value.copyWith(
      oldestDirectChatId: freezed == oldestDirectChatId
          ? _value.oldestDirectChatId
          : oldestDirectChatId // ignore: cast_nullable_to_non_nullable
              as String?,
      oldestDirectChatUpdateTime: freezed == oldestDirectChatUpdateTime
          ? _value.oldestDirectChatUpdateTime
          : oldestDirectChatUpdateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      oldestGroupChatId: freezed == oldestGroupChatId
          ? _value.oldestGroupChatId
          : oldestGroupChatId // ignore: cast_nullable_to_non_nullable
              as String?,
      oldestGroupChatDateTime: freezed == oldestGroupChatDateTime
          ? _value.oldestGroupChatDateTime
          : oldestGroupChatDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isOldestDirectChat: null == isOldestDirectChat
          ? _value.isOldestDirectChat
          : isOldestDirectChat // ignore: cast_nullable_to_non_nullable
              as bool,
      isOldestGroupChat: null == isOldestGroupChat
          ? _value.isOldestGroupChat
          : isOldestGroupChat // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatsPagingStateImplCopyWith<$Res>
    implements $ChatsPagingStateCopyWith<$Res> {
  factory _$$ChatsPagingStateImplCopyWith(_$ChatsPagingStateImpl value,
          $Res Function(_$ChatsPagingStateImpl) then) =
      __$$ChatsPagingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? oldestDirectChatId,
      DateTime? oldestDirectChatUpdateTime,
      String? oldestGroupChatId,
      DateTime? oldestGroupChatDateTime,
      bool isOldestDirectChat,
      bool isOldestGroupChat});
}

/// @nodoc
class __$$ChatsPagingStateImplCopyWithImpl<$Res>
    extends _$ChatsPagingStateCopyWithImpl<$Res, _$ChatsPagingStateImpl>
    implements _$$ChatsPagingStateImplCopyWith<$Res> {
  __$$ChatsPagingStateImplCopyWithImpl(_$ChatsPagingStateImpl _value,
      $Res Function(_$ChatsPagingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldestDirectChatId = freezed,
    Object? oldestDirectChatUpdateTime = freezed,
    Object? oldestGroupChatId = freezed,
    Object? oldestGroupChatDateTime = freezed,
    Object? isOldestDirectChat = null,
    Object? isOldestGroupChat = null,
  }) {
    return _then(_$ChatsPagingStateImpl(
      oldestDirectChatId: freezed == oldestDirectChatId
          ? _value.oldestDirectChatId
          : oldestDirectChatId // ignore: cast_nullable_to_non_nullable
              as String?,
      oldestDirectChatUpdateTime: freezed == oldestDirectChatUpdateTime
          ? _value.oldestDirectChatUpdateTime
          : oldestDirectChatUpdateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      oldestGroupChatId: freezed == oldestGroupChatId
          ? _value.oldestGroupChatId
          : oldestGroupChatId // ignore: cast_nullable_to_non_nullable
              as String?,
      oldestGroupChatDateTime: freezed == oldestGroupChatDateTime
          ? _value.oldestGroupChatDateTime
          : oldestGroupChatDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isOldestDirectChat: null == isOldestDirectChat
          ? _value.isOldestDirectChat
          : isOldestDirectChat // ignore: cast_nullable_to_non_nullable
              as bool,
      isOldestGroupChat: null == isOldestGroupChat
          ? _value.isOldestGroupChat
          : isOldestGroupChat // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChatsPagingStateImpl implements _ChatsPagingState {
  const _$ChatsPagingStateImpl(
      {this.oldestDirectChatId,
      this.oldestDirectChatUpdateTime,
      this.oldestGroupChatId,
      this.oldestGroupChatDateTime,
      this.isOldestDirectChat = false,
      this.isOldestGroupChat = false});

// The DM chat with the oldest updateTime that's currently loaded.
  @override
  final String? oldestDirectChatId;
// The update time of the oldest direct message chat.
  @override
  final DateTime? oldestDirectChatUpdateTime;
// The group chat with the oldest updateTime that's currently loaded.
  @override
  final String? oldestGroupChatId;
// The update time of the oldest group chat.
  @override
  final DateTime? oldestGroupChatDateTime;
// Whether the current oldestDirectChatId is the oldest direct chat.
  @override
  @JsonKey()
  final bool isOldestDirectChat;
// Whether the current oldestGroupChatId is the oldest group chat.
  @override
  @JsonKey()
  final bool isOldestGroupChat;

  @override
  String toString() {
    return 'ChatsPagingState(oldestDirectChatId: $oldestDirectChatId, oldestDirectChatUpdateTime: $oldestDirectChatUpdateTime, oldestGroupChatId: $oldestGroupChatId, oldestGroupChatDateTime: $oldestGroupChatDateTime, isOldestDirectChat: $isOldestDirectChat, isOldestGroupChat: $isOldestGroupChat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatsPagingStateImpl &&
            (identical(other.oldestDirectChatId, oldestDirectChatId) ||
                other.oldestDirectChatId == oldestDirectChatId) &&
            (identical(other.oldestDirectChatUpdateTime,
                    oldestDirectChatUpdateTime) ||
                other.oldestDirectChatUpdateTime ==
                    oldestDirectChatUpdateTime) &&
            (identical(other.oldestGroupChatId, oldestGroupChatId) ||
                other.oldestGroupChatId == oldestGroupChatId) &&
            (identical(
                    other.oldestGroupChatDateTime, oldestGroupChatDateTime) ||
                other.oldestGroupChatDateTime == oldestGroupChatDateTime) &&
            (identical(other.isOldestDirectChat, isOldestDirectChat) ||
                other.isOldestDirectChat == isOldestDirectChat) &&
            (identical(other.isOldestGroupChat, isOldestGroupChat) ||
                other.isOldestGroupChat == isOldestGroupChat));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      oldestDirectChatId,
      oldestDirectChatUpdateTime,
      oldestGroupChatId,
      oldestGroupChatDateTime,
      isOldestDirectChat,
      isOldestGroupChat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatsPagingStateImplCopyWith<_$ChatsPagingStateImpl> get copyWith =>
      __$$ChatsPagingStateImplCopyWithImpl<_$ChatsPagingStateImpl>(
          this, _$identity);
}

abstract class _ChatsPagingState implements ChatsPagingState {
  const factory _ChatsPagingState(
      {final String? oldestDirectChatId,
      final DateTime? oldestDirectChatUpdateTime,
      final String? oldestGroupChatId,
      final DateTime? oldestGroupChatDateTime,
      final bool isOldestDirectChat,
      final bool isOldestGroupChat}) = _$ChatsPagingStateImpl;

  @override // The DM chat with the oldest updateTime that's currently loaded.
  String? get oldestDirectChatId;
  @override // The update time of the oldest direct message chat.
  DateTime? get oldestDirectChatUpdateTime;
  @override // The group chat with the oldest updateTime that's currently loaded.
  String? get oldestGroupChatId;
  @override // The update time of the oldest group chat.
  DateTime? get oldestGroupChatDateTime;
  @override // Whether the current oldestDirectChatId is the oldest direct chat.
  bool get isOldestDirectChat;
  @override // Whether the current oldestGroupChatId is the oldest group chat.
  bool get isOldestGroupChat;
  @override
  @JsonKey(ignore: true)
  _$$ChatsPagingStateImplCopyWith<_$ChatsPagingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
