import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teams/core/forms/email_phone.dart';
import 'package:teams/core/forms/password.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(EmailPhone.pure()) EmailPhone emailPhone,
    @Default(Password.pure()) Password password,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus formzStatus,
    @Default(false) bool isValid,
    String? errorMessage,
  }) = _LoginState;
}
