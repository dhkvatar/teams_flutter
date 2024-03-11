import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/core/usecases/usecase.dart';
import 'package:teams/domain/entities/user.dart';
import 'package:teams/domain/repositories/auth_repository.dart';

part 'register_user.freezed.dart';

@injectable
class RegisterUser implements UseCase<User, RegisterUserParams> {
  final AuthRepository _authRepository;

  RegisterUser(this._authRepository);

  @override
  Future<User> call(RegisterUserParams params) async {
    return await _authRepository.signUp(
        email: params.email, password: params.password);
  }
}

@freezed
class RegisterUserParams with _$RegisterUserParams {
  const factory RegisterUserParams({
    required String email,
    required String password,
  }) = _RegisterUserParams;
}
