import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/core/usecases/usecase.dart';
import 'package:teams/domain/repositories/auth_repository.dart';

@lazySingleton
class Logout implements UseCase<void, NoParams?> {
  late final AuthRepository _authRepository;

  Logout() {
    _authRepository = getIt<AuthRepository>();
  }

  @override
  FutureOr<void> call([NoParams? params]) async {
    await _authRepository.logout();
  }
}
