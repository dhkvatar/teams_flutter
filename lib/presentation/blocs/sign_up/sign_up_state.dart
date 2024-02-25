import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teams/core/forms/email.dart';
import 'package:teams/core/forms/name.dart';
import 'package:teams/core/forms/password.dart';
import 'package:teams/core/forms/phone.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(Name.pure()) Name name,
    @Default(Phone.pure()) Phone phone,
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    @Default(Password.pure()) Password confirmPassword,
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus formzSubmissionStatus,
    @Default(false) bool isValid,
    String? errorMessage,
  }) = _SignUpState;
}
