import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/core/forms/email.dart';
import 'package:teams/core/forms/password.dart';
import 'package:teams/presentation/blocs/sign_up/sign_up_event.dart';
import 'package:teams/presentation/blocs/sign_up/sign_up_state.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<SignUpSubmitted>(_onSubmitted);
  }

  void _onEmailChanged(SignUpEmailChanged event, Emitter<SignUpState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([
            email,
            state.password,
            state.confirmPassword,
          ]) &&
          state.password.value == state.confirmPassword.value,
    ));
  }

  void _onPasswordChanged(
      SignUpPasswordChanged event, Emitter<SignUpState> emit) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([
            state.email,
            password,
            state.confirmPassword,
          ]) &&
          password.value == state.confirmPassword.value,
    ));
  }

  void _onConfirmPasswordChanged(
      SignUpConfirmPasswordChanged event, Emitter<SignUpState> emit) {
    final confirmPassword = Password.dirty(event.confirmPassword);
    emit(state.copyWith(
      confirmPassword: confirmPassword,
      isValid: Formz.validate([
            state.email,
            state.password,
            confirmPassword,
          ]) &&
          state.password.value == confirmPassword.value,
    ));
  }

  void _onSubmitted(SignUpSubmitted event, Emitter<SignUpState> emit) async {
    if (state.isValid) {
      emit(state.copyWith(
          formzSubmissionStatus: FormzSubmissionStatus.inProgress));
      try {
        await Future.delayed(const Duration(seconds: 1));
        emit(state.copyWith(
            formzSubmissionStatus: FormzSubmissionStatus.success));
      } catch (_) {
        emit(state.copyWith(
            formzSubmissionStatus: FormzSubmissionStatus.failure));
      }
    }
  }
}
