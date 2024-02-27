import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:teams/core/configs/app_config.dart';
import 'package:teams/data/repositories/fake_auth_repository.dart';
import 'package:teams/data/repositories/firebase_auth_repository.dart';
import 'package:teams/domain/repositories/auth_repository.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

// Dependency injection for AuthRepository
@module
abstract class AuthRepositoryInjection {
  @lazySingleton
  AuthRepository getAuthRepository() =>
      AppConfig.isTest ? FakeAuthRepository() : FirebaseAuthRepository();
}

@InjectableInit(initializerName: 'init')
void configureDependencies(String flavor) => getIt.init(environment: flavor);
