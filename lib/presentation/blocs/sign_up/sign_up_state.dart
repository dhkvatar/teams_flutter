import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teams/core/forms/email.dart';
import 'package:teams/core/forms/password.dart';

part 'sign_up_state.freezed.dart';

// State of the SignUpBloc.
@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    // Full name input.
    // @Default(Name.pure()) Name name,

    // Phone number input.
    // @Default(Phone.pure()) Phone phone,

    // Email input.
    @Default(Email.pure()) Email email,

    // Password input.
    @Default(Password.pure()) Password password,

    // Confirm password input.
    @Default(Password.pure()) Password confirmPassword,

    // Form submission status.
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus formzSubmissionStatus,

    // Whether the state is valid for submission.
    @Default(false) bool isValid,

    // Error message to display.
    String? errorMessage,
  }) = _SignUpState;
}
