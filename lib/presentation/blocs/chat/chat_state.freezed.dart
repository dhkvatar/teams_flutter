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
      throw _privateConstructorUsedError; // All messagtes loaded by Id.
  Map<String, Message> get messagesById =>
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
      Map<String, Message> messagesById,
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
    Object? messagesById = null,
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
      messagesById: null == messagesById
          ? _value.messagesById
          : messagesById // ignore: cast_nullable_to_non_nullable
              as Map<String, Message>,
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
      Map<String, Message> messagesById,
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
    Object? messagesById = null,
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
      messagesById: null == messagesById
          ? _value._messagesById
          : messagesById // ignore: cast_nullable_to_non_nullable
              as Map<String, Message>,
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
      final Map<String, Message> messagesById = const {},
      this.chatInput = const ChatInput.pure(),
      this.formzStatus = FormzSubmissionStatus.initial,
      this.isValid = false,
      this.errorMessage})
      : _chatsById = chatsById,
        _messagesById = messagesById;

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
    return 'ChatState(chatsById: $chatsById, messagesById: $messagesById, chatInput: $chatInput, formzStatus: $formzStatus, isValid: $isValid, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateImpl &&
            const DeepCollectionEquality()
                .equals(other._chatsById, _chatsById) &&
            const DeepCollectionEquality()
                .equals(other._messagesById, _messagesById) &&
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
      const DeepCollectionEquality().hash(_messagesById),
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
      final Map<String, Message> messagesById,
      final ChatInput chatInput,
      final FormzSubmissionStatus formzStatus,
      final bool isValid,
      final String? errorMessage}) = _$ChatStateImpl;

  @override // All chats loaded by Id.
  Map<String, Chat> get chatsById;
  @override // All messagtes loaded by Id.
  Map<String, Message> get messagesById;
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
// The chat with the oldest updateTime that's currently loaded.
  String? get oldestChatId =>
      throw _privateConstructorUsedError; // The update time of the oldest chat.
  DateTime? get oldestChatUpdateTime =>
      throw _privateConstructorUsedError; // Whether the current oldestChatId is the oldest chat in the chat repository.
  bool get isOldestChat => throw _privateConstructorUsedError;

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
      {String? oldestChatId,
      DateTime? oldestChatUpdateTime,
      bool isOldestChat});
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
    Object? oldestChatId = freezed,
    Object? oldestChatUpdateTime = freezed,
    Object? isOldestChat = null,
  }) {
    return _then(_value.copyWith(
      oldestChatId: freezed == oldestChatId
          ? _value.oldestChatId
          : oldestChatId // ignore: cast_nullable_to_non_nullable
              as String?,
      oldestChatUpdateTime: freezed == oldestChatUpdateTime
          ? _value.oldestChatUpdateTime
          : oldestChatUpdateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isOldestChat: null == isOldestChat
          ? _value.isOldestChat
          : isOldestChat // ignore: cast_nullable_to_non_nullable
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
      {String? oldestChatId,
      DateTime? oldestChatUpdateTime,
      bool isOldestChat});
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
    Object? oldestChatId = freezed,
    Object? oldestChatUpdateTime = freezed,
    Object? isOldestChat = null,
  }) {
    return _then(_$ChatsPagingStateImpl(
      oldestChatId: freezed == oldestChatId
          ? _value.oldestChatId
          : oldestChatId // ignore: cast_nullable_to_non_nullable
              as String?,
      oldestChatUpdateTime: freezed == oldestChatUpdateTime
          ? _value.oldestChatUpdateTime
          : oldestChatUpdateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isOldestChat: null == isOldestChat
          ? _value.isOldestChat
          : isOldestChat // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChatsPagingStateImpl implements _ChatsPagingState {
  const _$ChatsPagingStateImpl(
      {this.oldestChatId,
      this.oldestChatUpdateTime,
      this.isOldestChat = false});

// The chat with the oldest updateTime that's currently loaded.
  @override
  final String? oldestChatId;
// The update time of the oldest chat.
  @override
  final DateTime? oldestChatUpdateTime;
// Whether the current oldestChatId is the oldest chat in the chat repository.
  @override
  @JsonKey()
  final bool isOldestChat;

  @override
  String toString() {
    return 'ChatsPagingState(oldestChatId: $oldestChatId, oldestChatUpdateTime: $oldestChatUpdateTime, isOldestChat: $isOldestChat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatsPagingStateImpl &&
            (identical(other.oldestChatId, oldestChatId) ||
                other.oldestChatId == oldestChatId) &&
            (identical(other.oldestChatUpdateTime, oldestChatUpdateTime) ||
                other.oldestChatUpdateTime == oldestChatUpdateTime) &&
            (identical(other.isOldestChat, isOldestChat) ||
                other.isOldestChat == isOldestChat));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, oldestChatId, oldestChatUpdateTime, isOldestChat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatsPagingStateImplCopyWith<_$ChatsPagingStateImpl> get copyWith =>
      __$$ChatsPagingStateImplCopyWithImpl<_$ChatsPagingStateImpl>(
          this, _$identity);
}

abstract class _ChatsPagingState implements ChatsPagingState {
  const factory _ChatsPagingState(
      {final String? oldestChatId,
      final DateTime? oldestChatUpdateTime,
      final bool isOldestChat}) = _$ChatsPagingStateImpl;

  @override // The chat with the oldest updateTime that's currently loaded.
  String? get oldestChatId;
  @override // The update time of the oldest chat.
  DateTime? get oldestChatUpdateTime;
  @override // Whether the current oldestChatId is the oldest chat in the chat repository.
  bool get isOldestChat;
  @override
  @JsonKey(ignore: true)
  _$$ChatsPagingStateImplCopyWith<_$ChatsPagingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MessagesPagingState {
// The Id of the Chat that the state represents.
  String get chatId =>
      throw _privateConstructorUsedError; // The Id of the oldest message for the chat currently loaded.
  String? get oldestMessageId =>
      throw _privateConstructorUsedError; // The sent time of the oldest message for the chat.
  DateTime? get oldestMessageSentTime =>
      throw _privateConstructorUsedError; // Whether the current oldestMessageId is the oldest message in the chat.
  bool get isOldestMessage =>
      throw _privateConstructorUsedError; // The messages loaded for the chat over all pages, sorted.
  Map<String, Message> get messages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessagesPagingStateCopyWith<MessagesPagingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagesPagingStateCopyWith<$Res> {
  factory $MessagesPagingStateCopyWith(
          MessagesPagingState value, $Res Function(MessagesPagingState) then) =
      _$MessagesPagingStateCopyWithImpl<$Res, MessagesPagingState>;
  @useResult
  $Res call(
      {String chatId,
      String? oldestMessageId,
      DateTime? oldestMessageSentTime,
      bool isOldestMessage,
      Map<String, Message> messages});
}

/// @nodoc
class _$MessagesPagingStateCopyWithImpl<$Res, $Val extends MessagesPagingState>
    implements $MessagesPagingStateCopyWith<$Res> {
  _$MessagesPagingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? oldestMessageId = freezed,
    Object? oldestMessageSentTime = freezed,
    Object? isOldestMessage = null,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      oldestMessageId: freezed == oldestMessageId
          ? _value.oldestMessageId
          : oldestMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
      oldestMessageSentTime: freezed == oldestMessageSentTime
          ? _value.oldestMessageSentTime
          : oldestMessageSentTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isOldestMessage: null == isOldestMessage
          ? _value.isOldestMessage
          : isOldestMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as Map<String, Message>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessagesPagingStateImplCopyWith<$Res>
    implements $MessagesPagingStateCopyWith<$Res> {
  factory _$$MessagesPagingStateImplCopyWith(_$MessagesPagingStateImpl value,
          $Res Function(_$MessagesPagingStateImpl) then) =
      __$$MessagesPagingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String chatId,
      String? oldestMessageId,
      DateTime? oldestMessageSentTime,
      bool isOldestMessage,
      Map<String, Message> messages});
}

/// @nodoc
class __$$MessagesPagingStateImplCopyWithImpl<$Res>
    extends _$MessagesPagingStateCopyWithImpl<$Res, _$MessagesPagingStateImpl>
    implements _$$MessagesPagingStateImplCopyWith<$Res> {
  __$$MessagesPagingStateImplCopyWithImpl(_$MessagesPagingStateImpl _value,
      $Res Function(_$MessagesPagingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? oldestMessageId = freezed,
    Object? oldestMessageSentTime = freezed,
    Object? isOldestMessage = null,
    Object? messages = null,
  }) {
    return _then(_$MessagesPagingStateImpl(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      oldestMessageId: freezed == oldestMessageId
          ? _value.oldestMessageId
          : oldestMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
      oldestMessageSentTime: freezed == oldestMessageSentTime
          ? _value.oldestMessageSentTime
          : oldestMessageSentTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isOldestMessage: null == isOldestMessage
          ? _value.isOldestMessage
          : isOldestMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as Map<String, Message>,
    ));
  }
}

/// @nodoc

class _$MessagesPagingStateImpl implements _MessagesPagingState {
  const _$MessagesPagingStateImpl(
      {required this.chatId,
      this.oldestMessageId,
      this.oldestMessageSentTime,
      this.isOldestMessage = false,
      final Map<String, Message> messages = const {}})
      : _messages = messages;

// The Id of the Chat that the state represents.
  @override
  final String chatId;
// The Id of the oldest message for the chat currently loaded.
  @override
  final String? oldestMessageId;
// The sent time of the oldest message for the chat.
  @override
  final DateTime? oldestMessageSentTime;
// Whether the current oldestMessageId is the oldest message in the chat.
  @override
  @JsonKey()
  final bool isOldestMessage;
// The messages loaded for the chat over all pages, sorted.
  final Map<String, Message> _messages;
// The messages loaded for the chat over all pages, sorted.
  @override
  @JsonKey()
  Map<String, Message> get messages {
    if (_messages is EqualUnmodifiableMapView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_messages);
  }

  @override
  String toString() {
    return 'MessagesPagingState(chatId: $chatId, oldestMessageId: $oldestMessageId, oldestMessageSentTime: $oldestMessageSentTime, isOldestMessage: $isOldestMessage, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagesPagingStateImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.oldestMessageId, oldestMessageId) ||
                other.oldestMessageId == oldestMessageId) &&
            (identical(other.oldestMessageSentTime, oldestMessageSentTime) ||
                other.oldestMessageSentTime == oldestMessageSentTime) &&
            (identical(other.isOldestMessage, isOldestMessage) ||
                other.isOldestMessage == isOldestMessage) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      chatId,
      oldestMessageId,
      oldestMessageSentTime,
      isOldestMessage,
      const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessagesPagingStateImplCopyWith<_$MessagesPagingStateImpl> get copyWith =>
      __$$MessagesPagingStateImplCopyWithImpl<_$MessagesPagingStateImpl>(
          this, _$identity);
}

abstract class _MessagesPagingState implements MessagesPagingState {
  const factory _MessagesPagingState(
      {required final String chatId,
      final String? oldestMessageId,
      final DateTime? oldestMessageSentTime,
      final bool isOldestMessage,
      final Map<String, Message> messages}) = _$MessagesPagingStateImpl;

  @override // The Id of the Chat that the state represents.
  String get chatId;
  @override // The Id of the oldest message for the chat currently loaded.
  String? get oldestMessageId;
  @override // The sent time of the oldest message for the chat.
  DateTime? get oldestMessageSentTime;
  @override // Whether the current oldestMessageId is the oldest message in the chat.
  bool get isOldestMessage;
  @override // The messages loaded for the chat over all pages, sorted.
  Map<String, Message> get messages;
  @override
  @JsonKey(ignore: true)
  _$$MessagesPagingStateImplCopyWith<_$MessagesPagingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
