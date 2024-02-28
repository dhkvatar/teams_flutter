// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterUserParams {
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterUserParamsCopyWith<RegisterUserParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterUserParamsCopyWith<$Res> {
  factory $RegisterUserParamsCopyWith(
          RegisterUserParams value, $Res Function(RegisterUserParams) then) =
      _$RegisterUserParamsCopyWithImpl<$Res, RegisterUserParams>;
  @useResult
  $Res call({String email, String phone, String password});
}

/// @nodoc
class _$RegisterUserParamsCopyWithImpl<$Res, $Val extends RegisterUserParams>
    implements $RegisterUserParamsCopyWith<$Res> {
  _$RegisterUserParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? phone = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterUserParamsImplCopyWith<$Res>
    implements $RegisterUserParamsCopyWith<$Res> {
  factory _$$RegisterUserParamsImplCopyWith(_$RegisterUserParamsImpl value,
          $Res Function(_$RegisterUserParamsImpl) then) =
      __$$RegisterUserParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String phone, String password});
}

/// @nodoc
class __$$RegisterUserParamsImplCopyWithImpl<$Res>
    extends _$RegisterUserParamsCopyWithImpl<$Res, _$RegisterUserParamsImpl>
    implements _$$RegisterUserParamsImplCopyWith<$Res> {
  __$$RegisterUserParamsImplCopyWithImpl(_$RegisterUserParamsImpl _value,
      $Res Function(_$RegisterUserParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? phone = null,
    Object? password = null,
  }) {
    return _then(_$RegisterUserParamsImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterUserParamsImpl implements _RegisterUserParams {
  const _$RegisterUserParamsImpl(
      {required this.email, required this.phone, required this.password});

  @override
  final String email;
  @override
  final String phone;
  @override
  final String password;

  @override
  String toString() {
    return 'RegisterUserParams(email: $email, phone: $phone, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterUserParamsImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, phone, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterUserParamsImplCopyWith<_$RegisterUserParamsImpl> get copyWith =>
      __$$RegisterUserParamsImplCopyWithImpl<_$RegisterUserParamsImpl>(
          this, _$identity);
}

abstract class _RegisterUserParams implements RegisterUserParams {
  const factory _RegisterUserParams(
      {required final String email,
      required final String phone,
      required final String password}) = _$RegisterUserParamsImpl;

  @override
  String get email;
  @override
  String get phone;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$RegisterUserParamsImplCopyWith<_$RegisterUserParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
