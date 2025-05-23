import 'package:formz/formz.dart';

enum PasswordValidationError { invalid }

final class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure([super.value = '']) : super.pure();
  const Password.dirty([super.value = '']) : super.dirty();

  // static final _passwordRegex =
  //     RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError? validator(String? value) {
    return ((value?.length ?? 0) >= 5) ? null : PasswordValidationError.invalid;
    // return _passwordRegex.hasMatch(value ?? '')
    //     ? null
    //     : PasswordValidationError.invalid;
  }
}
