// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetMessagesParams {
  String get chatId => throw _privateConstructorUsedError;
  DateTime? get beforeDateTime => throw _privateConstructorUsedError;
  String? get beforeId => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetMessagesParamsCopyWith<GetMessagesParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetMessagesParamsCopyWith<$Res> {
  factory $GetMessagesParamsCopyWith(
          GetMessagesParams value, $Res Function(GetMessagesParams) then) =
      _$GetMessagesParamsCopyWithImpl<$Res, GetMessagesParams>;
  @useResult
  $Res call(
      {String chatId, DateTime? beforeDateTime, String? beforeId, int? limit});
}

/// @nodoc
class _$GetMessagesParamsCopyWithImpl<$Res, $Val extends GetMessagesParams>
    implements $GetMessagesParamsCopyWith<$Res> {
  _$GetMessagesParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? beforeDateTime = freezed,
    Object? beforeId = freezed,
    Object? limit = freezed,
  }) {
    return _then(_value.copyWith(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      beforeDateTime: freezed == beforeDateTime
          ? _value.beforeDateTime
          : beforeDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      beforeId: freezed == beforeId
          ? _value.beforeId
          : beforeId // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetMessagesParamsImplCopyWith<$Res>
    implements $GetMessagesParamsCopyWith<$Res> {
  factory _$$GetMessagesParamsImplCopyWith(_$GetMessagesParamsImpl value,
          $Res Function(_$GetMessagesParamsImpl) then) =
      __$$GetMessagesParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String chatId, DateTime? beforeDateTime, String? beforeId, int? limit});
}

/// @nodoc
class __$$GetMessagesParamsImplCopyWithImpl<$Res>
    extends _$GetMessagesParamsCopyWithImpl<$Res, _$GetMessagesParamsImpl>
    implements _$$GetMessagesParamsImplCopyWith<$Res> {
  __$$GetMessagesParamsImplCopyWithImpl(_$GetMessagesParamsImpl _value,
      $Res Function(_$GetMessagesParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? beforeDateTime = freezed,
    Object? beforeId = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$GetMessagesParamsImpl(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      beforeDateTime: freezed == beforeDateTime
          ? _value.beforeDateTime
          : beforeDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      beforeId: freezed == beforeId
          ? _value.beforeId
          : beforeId // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$GetMessagesParamsImpl implements _GetMessagesParams {
  const _$GetMessagesParamsImpl(
      {required this.chatId, this.beforeDateTime, this.beforeId, this.limit});

  @override
  final String chatId;
  @override
  final DateTime? beforeDateTime;
  @override
  final String? beforeId;
  @override
  final int? limit;

  @override
  String toString() {
    return 'GetMessagesParams(chatId: $chatId, beforeDateTime: $beforeDateTime, beforeId: $beforeId, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMessagesParamsImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.beforeDateTime, beforeDateTime) ||
                other.beforeDateTime == beforeDateTime) &&
            (identical(other.beforeId, beforeId) ||
                other.beforeId == beforeId) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, chatId, beforeDateTime, beforeId, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMessagesParamsImplCopyWith<_$GetMessagesParamsImpl> get copyWith =>
      __$$GetMessagesParamsImplCopyWithImpl<_$GetMessagesParamsImpl>(
          this, _$identity);
}

abstract class _GetMessagesParams implements GetMessagesParams {
  const factory _GetMessagesParams(
      {required final String chatId,
      final DateTime? beforeDateTime,
      final String? beforeId,
      final int? limit}) = _$GetMessagesParamsImpl;

  @override
  String get chatId;
  @override
  DateTime? get beforeDateTime;
  @override
  String? get beforeId;
  @override
  int? get limit;
  @override
  @JsonKey(ignore: true)
  _$$GetMessagesParamsImplCopyWith<_$GetMessagesParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
