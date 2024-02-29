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
// List of direct message chats, sorted by updateTime and Id (descending).
  List<Chat> get directMessageChats =>
      throw _privateConstructorUsedError; // List of group chats, sorted by updateTime and Id (descending).
  List<Chat> get groupChats =>
      throw _privateConstructorUsedError; // The last direct message chat by updateTime and Id, i.e., the earliest
// created with the smallest Id in directMessageChats.
  Chat? get lastDirectMessageChat =>
      throw _privateConstructorUsedError; // The last group chat by updateTime and Id, i.e., the earliest created
// with the smallest Id in groupChats.
  Chat? get lastGroupChat =>
      throw _privateConstructorUsedError; // Map from Chat Id to the last message (earliest timestamp and smallest
// Id) for each chat.
  Map<String, Message>? get lastMessage =>
      throw _privateConstructorUsedError; // The loading status of the chats on the chat page.
  dynamic get chatsLoadingStatus =>
      throw _privateConstructorUsedError; // Loaded messages for each chat.
  Map<String, List<Message>>? get chatMessages =>
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
      {List<Chat> directMessageChats,
      List<Chat> groupChats,
      Chat? lastDirectMessageChat,
      Chat? lastGroupChat,
      Map<String, Message>? lastMessage,
      dynamic chatsLoadingStatus,
      Map<String, List<Message>>? chatMessages,
      String? errorMessage});

  $ChatCopyWith<$Res>? get lastDirectMessageChat;
  $ChatCopyWith<$Res>? get lastGroupChat;
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
    Object? directMessageChats = null,
    Object? groupChats = null,
    Object? lastDirectMessageChat = freezed,
    Object? lastGroupChat = freezed,
    Object? lastMessage = freezed,
    Object? chatsLoadingStatus = freezed,
    Object? chatMessages = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      directMessageChats: null == directMessageChats
          ? _value.directMessageChats
          : directMessageChats // ignore: cast_nullable_to_non_nullable
              as List<Chat>,
      groupChats: null == groupChats
          ? _value.groupChats
          : groupChats // ignore: cast_nullable_to_non_nullable
              as List<Chat>,
      lastDirectMessageChat: freezed == lastDirectMessageChat
          ? _value.lastDirectMessageChat
          : lastDirectMessageChat // ignore: cast_nullable_to_non_nullable
              as Chat?,
      lastGroupChat: freezed == lastGroupChat
          ? _value.lastGroupChat
          : lastGroupChat // ignore: cast_nullable_to_non_nullable
              as Chat?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as Map<String, Message>?,
      chatsLoadingStatus: freezed == chatsLoadingStatus
          ? _value.chatsLoadingStatus
          : chatsLoadingStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      chatMessages: freezed == chatMessages
          ? _value.chatMessages
          : chatMessages // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Message>>?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatCopyWith<$Res>? get lastDirectMessageChat {
    if (_value.lastDirectMessageChat == null) {
      return null;
    }

    return $ChatCopyWith<$Res>(_value.lastDirectMessageChat!, (value) {
      return _then(_value.copyWith(lastDirectMessageChat: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatCopyWith<$Res>? get lastGroupChat {
    if (_value.lastGroupChat == null) {
      return null;
    }

    return $ChatCopyWith<$Res>(_value.lastGroupChat!, (value) {
      return _then(_value.copyWith(lastGroupChat: value) as $Val);
    });
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
      {List<Chat> directMessageChats,
      List<Chat> groupChats,
      Chat? lastDirectMessageChat,
      Chat? lastGroupChat,
      Map<String, Message>? lastMessage,
      dynamic chatsLoadingStatus,
      Map<String, List<Message>>? chatMessages,
      String? errorMessage});

  @override
  $ChatCopyWith<$Res>? get lastDirectMessageChat;
  @override
  $ChatCopyWith<$Res>? get lastGroupChat;
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
    Object? directMessageChats = null,
    Object? groupChats = null,
    Object? lastDirectMessageChat = freezed,
    Object? lastGroupChat = freezed,
    Object? lastMessage = freezed,
    Object? chatsLoadingStatus = freezed,
    Object? chatMessages = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$ChatStateImpl(
      directMessageChats: null == directMessageChats
          ? _value._directMessageChats
          : directMessageChats // ignore: cast_nullable_to_non_nullable
              as List<Chat>,
      groupChats: null == groupChats
          ? _value._groupChats
          : groupChats // ignore: cast_nullable_to_non_nullable
              as List<Chat>,
      lastDirectMessageChat: freezed == lastDirectMessageChat
          ? _value.lastDirectMessageChat
          : lastDirectMessageChat // ignore: cast_nullable_to_non_nullable
              as Chat?,
      lastGroupChat: freezed == lastGroupChat
          ? _value.lastGroupChat
          : lastGroupChat // ignore: cast_nullable_to_non_nullable
              as Chat?,
      lastMessage: freezed == lastMessage
          ? _value._lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as Map<String, Message>?,
      chatsLoadingStatus: freezed == chatsLoadingStatus
          ? _value.chatsLoadingStatus!
          : chatsLoadingStatus,
      chatMessages: freezed == chatMessages
          ? _value._chatMessages
          : chatMessages // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Message>>?,
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
      {final List<Chat> directMessageChats = const [],
      final List<Chat> groupChats = const [],
      this.lastDirectMessageChat,
      this.lastGroupChat,
      final Map<String, Message>? lastMessage,
      this.chatsLoadingStatus = ChatsLoadingStatus.complete,
      final Map<String, List<Message>>? chatMessages,
      this.errorMessage})
      : _directMessageChats = directMessageChats,
        _groupChats = groupChats,
        _lastMessage = lastMessage,
        _chatMessages = chatMessages;

// List of direct message chats, sorted by updateTime and Id (descending).
  final List<Chat> _directMessageChats;
// List of direct message chats, sorted by updateTime and Id (descending).
  @override
  @JsonKey()
  List<Chat> get directMessageChats {
    if (_directMessageChats is EqualUnmodifiableListView)
      return _directMessageChats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_directMessageChats);
  }

// List of group chats, sorted by updateTime and Id (descending).
  final List<Chat> _groupChats;
// List of group chats, sorted by updateTime and Id (descending).
  @override
  @JsonKey()
  List<Chat> get groupChats {
    if (_groupChats is EqualUnmodifiableListView) return _groupChats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groupChats);
  }

// The last direct message chat by updateTime and Id, i.e., the earliest
// created with the smallest Id in directMessageChats.
  @override
  final Chat? lastDirectMessageChat;
// The last group chat by updateTime and Id, i.e., the earliest created
// with the smallest Id in groupChats.
  @override
  final Chat? lastGroupChat;
// Map from Chat Id to the last message (earliest timestamp and smallest
// Id) for each chat.
  final Map<String, Message>? _lastMessage;
// Map from Chat Id to the last message (earliest timestamp and smallest
// Id) for each chat.
  @override
  Map<String, Message>? get lastMessage {
    final value = _lastMessage;
    if (value == null) return null;
    if (_lastMessage is EqualUnmodifiableMapView) return _lastMessage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

// The loading status of the chats on the chat page.
  @override
  @JsonKey()
  final dynamic chatsLoadingStatus;
// Loaded messages for each chat.
  final Map<String, List<Message>>? _chatMessages;
// Loaded messages for each chat.
  @override
  Map<String, List<Message>>? get chatMessages {
    final value = _chatMessages;
    if (value == null) return null;
    if (_chatMessages is EqualUnmodifiableMapView) return _chatMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

// Error message to display after processing a ChatEvent.
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ChatState(directMessageChats: $directMessageChats, groupChats: $groupChats, lastDirectMessageChat: $lastDirectMessageChat, lastGroupChat: $lastGroupChat, lastMessage: $lastMessage, chatsLoadingStatus: $chatsLoadingStatus, chatMessages: $chatMessages, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateImpl &&
            const DeepCollectionEquality()
                .equals(other._directMessageChats, _directMessageChats) &&
            const DeepCollectionEquality()
                .equals(other._groupChats, _groupChats) &&
            (identical(other.lastDirectMessageChat, lastDirectMessageChat) ||
                other.lastDirectMessageChat == lastDirectMessageChat) &&
            (identical(other.lastGroupChat, lastGroupChat) ||
                other.lastGroupChat == lastGroupChat) &&
            const DeepCollectionEquality()
                .equals(other._lastMessage, _lastMessage) &&
            const DeepCollectionEquality()
                .equals(other.chatsLoadingStatus, chatsLoadingStatus) &&
            const DeepCollectionEquality()
                .equals(other._chatMessages, _chatMessages) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_directMessageChats),
      const DeepCollectionEquality().hash(_groupChats),
      lastDirectMessageChat,
      lastGroupChat,
      const DeepCollectionEquality().hash(_lastMessage),
      const DeepCollectionEquality().hash(chatsLoadingStatus),
      const DeepCollectionEquality().hash(_chatMessages),
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      __$$ChatStateImplCopyWithImpl<_$ChatStateImpl>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  const factory _ChatState(
      {final List<Chat> directMessageChats,
      final List<Chat> groupChats,
      final Chat? lastDirectMessageChat,
      final Chat? lastGroupChat,
      final Map<String, Message>? lastMessage,
      final dynamic chatsLoadingStatus,
      final Map<String, List<Message>>? chatMessages,
      final String? errorMessage}) = _$ChatStateImpl;

  @override // List of direct message chats, sorted by updateTime and Id (descending).
  List<Chat> get directMessageChats;
  @override // List of group chats, sorted by updateTime and Id (descending).
  List<Chat> get groupChats;
  @override // The last direct message chat by updateTime and Id, i.e., the earliest
// created with the smallest Id in directMessageChats.
  Chat? get lastDirectMessageChat;
  @override // The last group chat by updateTime and Id, i.e., the earliest created
// with the smallest Id in groupChats.
  Chat? get lastGroupChat;
  @override // Map from Chat Id to the last message (earliest timestamp and smallest
// Id) for each chat.
  Map<String, Message>? get lastMessage;
  @override // The loading status of the chats on the chat page.
  dynamic get chatsLoadingStatus;
  @override // Loaded messages for each chat.
  Map<String, List<Message>>? get chatMessages;
  @override // Error message to display after processing a ChatEvent.
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
