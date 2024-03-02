import 'package:formz/formz.dart';

enum ChatInputValidationError { invalid }

final class ChatInput extends FormzInput<String, ChatInputValidationError> {
  const ChatInput.pure([super.value = '']) : super.pure();
  const ChatInput.dirty([super.value = '']) : super.dirty();

  @override
  ChatInputValidationError? validator(String? value) {
    return (value?.length ?? 0) > 0 ? null : ChatInputValidationError.invalid;
  }
}
