import 'package:formz/formz.dart';

enum EmailPhoneValidationError { invalid }

final class EmailPhone extends FormzInput<String, EmailPhoneValidationError> {
  const EmailPhone.pure([super.value = '']) : super.pure();
  const EmailPhone.dirty([super.value = '']) : super.dirty();

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final _phoneRegex = RegExp(
    r'^(?:\+[0-9]+)?(?:[0-9] ?){6,14}[0-9]$',
  );

  @override
  EmailPhoneValidationError? validator(String? value) {
    final emailMatch = _emailRegex.hasMatch(value ?? '');
    final phoneMatch = _phoneRegex.hasMatch(value ?? '');
    if (emailMatch || phoneMatch) {
      return null;
    } else {
      return EmailPhoneValidationError.invalid;
    }
  }
}
