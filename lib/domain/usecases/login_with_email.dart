import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/core/usecases/usecase.dart';
import 'package:teams/domain/repositories/auth_repository.dart';

part 'login_with_email.freezed.dart';

@injectable
class LoginWithEmail implements UseCase<void, LoginWithEmailParams> {
  final AuthRepository _authRepository;

  LoginWithEmail(this._authRepository);

  @override
  FutureOr<void> call(LoginWithEmailParams params) async {
    await _authRepository.loginWithEmailPassword(
        email: params.email, password: params.password);
  }
}

@freezed
class LoginWithEmailParams with _$LoginWithEmailParams {
  const factory LoginWithEmailParams({
    required String email,
    required String password,
  }) = _LoginWithEmailParams;
}
