// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatUpdateStreamItem {
// The Id of the Chat  the update is on.
  String get chatId => throw _privateConstructorUsedError; // The update type.
  ChatUpdateType get updateType =>
      throw _privateConstructorUsedError; // The Id of the new message.
// Applies to newMessageUploadSuccess and newMessageUploadFailure types.
  String? get newMessageId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatUpdateStreamItemCopyWith<ChatUpdateStreamItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatUpdateStreamItemCopyWith<$Res> {
  factory $ChatUpdateStreamItemCopyWith(ChatUpdateStreamItem value,
          $Res Function(ChatUpdateStreamItem) then) =
      _$ChatUpdateStreamItemCopyWithImpl<$Res, ChatUpdateStreamItem>;
  @useResult
  $Res call({String chatId, ChatUpdateType updateType, String? newMessageId});
}

/// @nodoc
class _$ChatUpdateStreamItemCopyWithImpl<$Res,
        $Val extends ChatUpdateStreamItem>
    implements $ChatUpdateStreamItemCopyWith<$Res> {
  _$ChatUpdateStreamItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? updateType = null,
    Object? newMessageId = freezed,
  }) {
    return _then(_value.copyWith(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      updateType: null == updateType
          ? _value.updateType
          : updateType // ignore: cast_nullable_to_non_nullable
              as ChatUpdateType,
      newMessageId: freezed == newMessageId
          ? _value.newMessageId
          : newMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatUpdateStreamItemImplCopyWith<$Res>
    implements $ChatUpdateStreamItemCopyWith<$Res> {
  factory _$$ChatUpdateStreamItemImplCopyWith(_$ChatUpdateStreamItemImpl value,
          $Res Function(_$ChatUpdateStreamItemImpl) then) =
      __$$ChatUpdateStreamItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String chatId, ChatUpdateType updateType, String? newMessageId});
}

/// @nodoc
class __$$ChatUpdateStreamItemImplCopyWithImpl<$Res>
    extends _$ChatUpdateStreamItemCopyWithImpl<$Res, _$ChatUpdateStreamItemImpl>
    implements _$$ChatUpdateStreamItemImplCopyWith<$Res> {
  __$$ChatUpdateStreamItemImplCopyWithImpl(_$ChatUpdateStreamItemImpl _value,
      $Res Function(_$ChatUpdateStreamItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? updateType = null,
    Object? newMessageId = freezed,
  }) {
    return _then(_$ChatUpdateStreamItemImpl(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      updateType: null == updateType
          ? _value.updateType
          : updateType // ignore: cast_nullable_to_non_nullable
              as ChatUpdateType,
      newMessageId: freezed == newMessageId
          ? _value.newMessageId
          : newMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChatUpdateStreamItemImpl implements _ChatUpdateStreamItem {
  const _$ChatUpdateStreamItemImpl(
      {required this.chatId, required this.updateType, this.newMessageId});

// The Id of the Chat  the update is on.
  @override
  final String chatId;
// The update type.
  @override
  final ChatUpdateType updateType;
// The Id of the new message.
// Applies to newMessageUploadSuccess and newMessageUploadFailure types.
  @override
  final String? newMessageId;

  @override
  String toString() {
    return 'ChatUpdateStreamItem(chatId: $chatId, updateType: $updateType, newMessageId: $newMessageId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatUpdateStreamItemImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.updateType, updateType) ||
                other.updateType == updateType) &&
            (identical(other.newMessageId, newMessageId) ||
                other.newMessageId == newMessageId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, chatId, updateType, newMessageId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatUpdateStreamItemImplCopyWith<_$ChatUpdateStreamItemImpl>
      get copyWith =>
          __$$ChatUpdateStreamItemImplCopyWithImpl<_$ChatUpdateStreamItemImpl>(
              this, _$identity);
}

abstract class _ChatUpdateStreamItem implements ChatUpdateStreamItem {
  const factory _ChatUpdateStreamItem(
      {required final String chatId,
      required final ChatUpdateType updateType,
      final String? newMessageId}) = _$ChatUpdateStreamItemImpl;

  @override // The Id of the Chat  the update is on.
  String get chatId;
  @override // The update type.
  ChatUpdateType get updateType;
  @override // The Id of the new message.
// Applies to newMessageUploadSuccess and newMessageUploadFailure types.
  String? get newMessageId;
  @override
  @JsonKey(ignore: true)
  _$$ChatUpdateStreamItemImplCopyWith<_$ChatUpdateStreamItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
