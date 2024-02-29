import 'package:injectable/injectable.dart';
import 'package:teams/app/di/di.dart';
import 'package:teams/core/usecases/usecase.dart';
import 'package:teams/domain/entities/user.dart';
import 'package:teams/domain/repositories/auth_repository.dart';

@injectable
class GetCurrentUser implements UseCase<User?, NoParams?> {
  late final AuthRepository _authRepository;

  GetCurrentUser() {
    _authRepository = getIt<AuthRepository>();
  }

  @override
  User? call([NoParams? params]) {
    return _authRepository.currentUser;
  }
}
