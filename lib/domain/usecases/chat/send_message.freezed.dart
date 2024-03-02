// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SendMessageParams {
  String get chatId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SendMessageParamsCopyWith<SendMessageParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendMessageParamsCopyWith<$Res> {
  factory $SendMessageParamsCopyWith(
          SendMessageParams value, $Res Function(SendMessageParams) then) =
      _$SendMessageParamsCopyWithImpl<$Res, SendMessageParams>;
  @useResult
  $Res call({String chatId, String message});
}

/// @nodoc
class _$SendMessageParamsCopyWithImpl<$Res, $Val extends SendMessageParams>
    implements $SendMessageParamsCopyWith<$Res> {
  _$SendMessageParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendMessageParamsImplCopyWith<$Res>
    implements $SendMessageParamsCopyWith<$Res> {
  factory _$$SendMessageParamsImplCopyWith(_$SendMessageParamsImpl value,
          $Res Function(_$SendMessageParamsImpl) then) =
      __$$SendMessageParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String chatId, String message});
}

/// @nodoc
class __$$SendMessageParamsImplCopyWithImpl<$Res>
    extends _$SendMessageParamsCopyWithImpl<$Res, _$SendMessageParamsImpl>
    implements _$$SendMessageParamsImplCopyWith<$Res> {
  __$$SendMessageParamsImplCopyWithImpl(_$SendMessageParamsImpl _value,
      $Res Function(_$SendMessageParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? message = null,
  }) {
    return _then(_$SendMessageParamsImpl(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendMessageParamsImpl
    with DiagnosticableTreeMixin
    implements _SendMessageParams {
  const _$SendMessageParamsImpl({required this.chatId, required this.message});

  @override
  final String chatId;
  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SendMessageParams(chatId: $chatId, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SendMessageParams'))
      ..add(DiagnosticsProperty('chatId', chatId))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageParamsImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chatId, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageParamsImplCopyWith<_$SendMessageParamsImpl> get copyWith =>
      __$$SendMessageParamsImplCopyWithImpl<_$SendMessageParamsImpl>(
          this, _$identity);
}

abstract class _SendMessageParams implements SendMessageParams {
  const factory _SendMessageParams(
      {required final String chatId,
      required final String message}) = _$SendMessageParamsImpl;

  @override
  String get chatId;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$SendMessageParamsImplCopyWith<_$SendMessageParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
