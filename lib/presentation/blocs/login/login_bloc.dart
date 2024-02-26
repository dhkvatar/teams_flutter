import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/core/forms/email_phone.dart';
import 'package:teams/core/forms/password.dart';
import 'package:teams/domain/usecases/login_with_email.dart';
import 'package:teams/presentation/blocs/login/login_event.dart';
import 'package:teams/presentation/blocs/login/login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    final emailPhone = EmailPhone.dirty(event.email);
    emit(state.copyWith(
        emailPhone: emailPhone,
        isValid: Formz.validate([emailPhone, state.password])));
  }

  void _onPasswordChanged(
      LoginPasswordChanged event, Emitter<LoginState> emit) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
        password: password,
        isValid: Formz.validate([state.emailPhone, password])));
  }

  Future<void> _onSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    if (state.isValid) {
      emit(state.copyWith(formzStatus: FormzSubmissionStatus.inProgress));
      try {
        await getIt<LoginWithEmail>()(LoginWithEmailParams(
            email: state.emailPhone.value, password: state.password.value));
        await Future.delayed(const Duration(seconds: 1));
        emit(state.copyWith(formzStatus: FormzSubmissionStatus.success));
      } catch (_) {
        emit(state.copyWith(formzStatus: FormzSubmissionStatus.failure));
      }
    }
  }
}
