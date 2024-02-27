// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Chat {
// The unique identifier of the chat.
  String get id =>
      throw _privateConstructorUsedError; // The Id's of the users in the chat.
  List<String> get userIds =>
      throw _privateConstructorUsedError; // The name of the chat,
  String get name =>
      throw _privateConstructorUsedError; // The time the chat was created.
  DateTime get createTime =>
      throw _privateConstructorUsedError; // The last update time.
  DateTime get updateTime =>
      throw _privateConstructorUsedError; // Whether this is a group chat.
  bool get isGroupChat => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatCopyWith<Chat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCopyWith<$Res> {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) then) =
      _$ChatCopyWithImpl<$Res, Chat>;
  @useResult
  $Res call(
      {String id,
      List<String> userIds,
      String name,
      DateTime createTime,
      DateTime updateTime,
      bool isGroupChat});
}

/// @nodoc
class _$ChatCopyWithImpl<$Res, $Val extends Chat>
    implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userIds = null,
    Object? name = null,
    Object? createTime = null,
    Object? updateTime = null,
    Object? isGroupChat = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userIds: null == userIds
          ? _value.userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateTime: null == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isGroupChat: null == isGroupChat
          ? _value.isGroupChat
          : isGroupChat // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatImplCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$$ChatImplCopyWith(
          _$ChatImpl value, $Res Function(_$ChatImpl) then) =
      __$$ChatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      List<String> userIds,
      String name,
      DateTime createTime,
      DateTime updateTime,
      bool isGroupChat});
}

/// @nodoc
class __$$ChatImplCopyWithImpl<$Res>
    extends _$ChatCopyWithImpl<$Res, _$ChatImpl>
    implements _$$ChatImplCopyWith<$Res> {
  __$$ChatImplCopyWithImpl(_$ChatImpl _value, $Res Function(_$ChatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userIds = null,
    Object? name = null,
    Object? createTime = null,
    Object? updateTime = null,
    Object? isGroupChat = null,
  }) {
    return _then(_$ChatImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userIds: null == userIds
          ? _value._userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateTime: null == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isGroupChat: null == isGroupChat
          ? _value.isGroupChat
          : isGroupChat // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChatImpl implements _Chat {
  const _$ChatImpl(
      {required this.id,
      required final List<String> userIds,
      required this.name,
      required this.createTime,
      required this.updateTime,
      required this.isGroupChat})
      : _userIds = userIds;

// The unique identifier of the chat.
  @override
  final String id;
// The Id's of the users in the chat.
  final List<String> _userIds;
// The Id's of the users in the chat.
  @override
  List<String> get userIds {
    if (_userIds is EqualUnmodifiableListView) return _userIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userIds);
  }

// The name of the chat,
  @override
  final String name;
// The time the chat was created.
  @override
  final DateTime createTime;
// The last update time.
  @override
  final DateTime updateTime;
// Whether this is a group chat.
  @override
  final bool isGroupChat;

  @override
  String toString() {
    return 'Chat(id: $id, userIds: $userIds, name: $name, createTime: $createTime, updateTime: $updateTime, isGroupChat: $isGroupChat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._userIds, _userIds) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createTime, createTime) ||
                other.createTime == createTime) &&
            (identical(other.updateTime, updateTime) ||
                other.updateTime == updateTime) &&
            (identical(other.isGroupChat, isGroupChat) ||
                other.isGroupChat == isGroupChat));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_userIds),
      name,
      createTime,
      updateTime,
      isGroupChat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatImplCopyWith<_$ChatImpl> get copyWith =>
      __$$ChatImplCopyWithImpl<_$ChatImpl>(this, _$identity);
}

abstract class _Chat implements Chat {
  const factory _Chat(
      {required final String id,
      required final List<String> userIds,
      required final String name,
      required final DateTime createTime,
      required final DateTime updateTime,
      required final bool isGroupChat}) = _$ChatImpl;

  @override // The unique identifier of the chat.
  String get id;
  @override // The Id's of the users in the chat.
  List<String> get userIds;
  @override // The name of the chat,
  String get name;
  @override // The time the chat was created.
  DateTime get createTime;
  @override // The last update time.
  DateTime get updateTime;
  @override // Whether this is a group chat.
  bool get isGroupChat;
  @override
  @JsonKey(ignore: true)
  _$$ChatImplCopyWith<_$ChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
