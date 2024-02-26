import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/core/usecases/usecase.dart';
import 'package:teams/domain/repositories/auth_repository.dart';

@injectable
class IsUserLoggedIn implements UseCase<bool, NoParams?> {
  late final AuthRepository _authRepository;

  @visibleForTesting
  IsUserLoggedIn.withAuthRepo(this._authRepository);

  @factoryMethod
  IsUserLoggedIn() {
    _authRepository = getIt<AuthRepository>();
  }

  @override
  bool call([NoParams? params]) {
    return _authRepository.isLoggedIn;
  }
}
