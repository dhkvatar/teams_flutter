import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/core/usecases/usecase.dart';
import 'package:teams/domain/entities/user.dart';
import 'package:teams/domain/repositories/auth_repository.dart';

@lazySingleton
class GetUserStream implements UseCase<Stream<User?>, NoParams?> {
  late final AuthRepository _authRepository;

  @visibleForTesting
  GetUserStream.withAuthRepo(this._authRepository);

  GetUserStream() {
    _authRepository = getIt<AuthRepository>();
  }

  @override
  Stream<User?> call([NoParams? params]) {
    return _authRepository.user;
  }
}
