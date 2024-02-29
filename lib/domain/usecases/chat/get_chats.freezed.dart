// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_chats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetChatsParams {
  DateTime? get beforeDateTime => throw _privateConstructorUsedError;
  String? get beforeId => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetChatsParamsCopyWith<GetChatsParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetChatsParamsCopyWith<$Res> {
  factory $GetChatsParamsCopyWith(
          GetChatsParams value, $Res Function(GetChatsParams) then) =
      _$GetChatsParamsCopyWithImpl<$Res, GetChatsParams>;
  @useResult
  $Res call({DateTime? beforeDateTime, String? beforeId, int? limit});
}

/// @nodoc
class _$GetChatsParamsCopyWithImpl<$Res, $Val extends GetChatsParams>
    implements $GetChatsParamsCopyWith<$Res> {
  _$GetChatsParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beforeDateTime = freezed,
    Object? beforeId = freezed,
    Object? limit = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$GetChatsParamsImplCopyWith<$Res>
    implements $GetChatsParamsCopyWith<$Res> {
  factory _$$GetChatsParamsImplCopyWith(_$GetChatsParamsImpl value,
          $Res Function(_$GetChatsParamsImpl) then) =
      __$$GetChatsParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? beforeDateTime, String? beforeId, int? limit});
}

/// @nodoc
class __$$GetChatsParamsImplCopyWithImpl<$Res>
    extends _$GetChatsParamsCopyWithImpl<$Res, _$GetChatsParamsImpl>
    implements _$$GetChatsParamsImplCopyWith<$Res> {
  __$$GetChatsParamsImplCopyWithImpl(
      _$GetChatsParamsImpl _value, $Res Function(_$GetChatsParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beforeDateTime = freezed,
    Object? beforeId = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$GetChatsParamsImpl(
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

class _$GetChatsParamsImpl implements _GetChatsParams {
  const _$GetChatsParamsImpl({this.beforeDateTime, this.beforeId, this.limit});

  @override
  final DateTime? beforeDateTime;
  @override
  final String? beforeId;
  @override
  final int? limit;

  @override
  String toString() {
    return 'GetChatsParams(beforeDateTime: $beforeDateTime, beforeId: $beforeId, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetChatsParamsImpl &&
            (identical(other.beforeDateTime, beforeDateTime) ||
                other.beforeDateTime == beforeDateTime) &&
            (identical(other.beforeId, beforeId) ||
                other.beforeId == beforeId) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, beforeDateTime, beforeId, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetChatsParamsImplCopyWith<_$GetChatsParamsImpl> get copyWith =>
      __$$GetChatsParamsImplCopyWithImpl<_$GetChatsParamsImpl>(
          this, _$identity);
}

abstract class _GetChatsParams implements GetChatsParams {
  const factory _GetChatsParams(
      {final DateTime? beforeDateTime,
      final String? beforeId,
      final int? limit}) = _$GetChatsParamsImpl;

  @override
  DateTime? get beforeDateTime;
  @override
  String? get beforeId;
  @override
  int? get limit;
  @override
  @JsonKey(ignore: true)
  _$$GetChatsParamsImplCopyWith<_$GetChatsParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
