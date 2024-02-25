import 'package:formz/formz.dart';

enum NameValidationError { invalid }

final class Name extends FormzInput<String, NameValidationError> {
  const Name.pure([super.value = '']) : super.pure();
  const Name.dirty([super.value = '']) : super.dirty();

  @override
  NameValidationError? validator(String? value) {
    return (value?.length ?? 0) > 0 ? null : NameValidationError.invalid;
  }
}
