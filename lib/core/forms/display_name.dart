import 'package:formz/formz.dart';

enum DisplayNameValidationError { invalid, alreadyTaken }

final class DisplayName extends FormzInput<String, DisplayNameValidationError> {
  const DisplayName.pure([super.value = '']) : super.pure();
  const DisplayName.dirty([super.value = '']) : super.dirty();

  @override
  DisplayNameValidationError? validator(String? value) {
    return ((value?.length ?? 0) >= 5)
        ? null
        : DisplayNameValidationError.invalid;
  }
}
