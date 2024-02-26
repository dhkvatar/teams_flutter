import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:teams/domain/repositories/auth_repository.dart';
import 'package:teams/domain/usecases/is_user_logged_in.dart';

@GenerateNiceMocks([MockSpec<AuthRepository>()])
import 'is_user_logged_in_test.mocks.dart';

void main() {
  test('should get whether the user is logged in from the auth repository', () {
    // arrange
    final mockAuthRepository = MockAuthRepository();
    when(mockAuthRepository.isLoggedIn).thenReturn(true);
    // act
    final isLoggedIn = IsUserLoggedIn.withAuthRepo(mockAuthRepository)();
    // assert
    expect(isLoggedIn, true);
    verify(mockAuthRepository.isLoggedIn).called(1);
  });
}
