import 'package:flutter_test/flutter_test.dart';
import 'package:teams/core/exceptions/auth_exception.dart';
import 'package:teams/data/repositories/fake_auth_repository.dart';
import 'package:teams/domain/entities/user.dart';

void main() {
  const user1 = User(id: 'uid1', email: 'user1@test.com', phone: '1111111');
  const user2 = User(id: 'uid2', email: 'user2@test.com', phone: '2222222');
  const password1 = 'password1';
  const password2 = 'password2';

  group('signUp', () {
    test('throws AuthException alreadyLoggedIn', () async {
      final fakeAuthRepository = FakeAuthRepository();
      fakeAuthRepository
          .backfillUsers({user1.id: user1}, {user1.id: password1});
      fakeAuthRepository.setCurrentUser(user1);
      expect(
        () async {
          await fakeAuthRepository.signUp(
              email: user2.email!, phone: user2.phone!, password: password2);
        },
        throwsA(predicate((e) =>
            e is AuthException && e.type == AuthExceptionType.alreadyLoggedIn)),
      );
      await fakeAuthRepository.onDispose();
    });
    test('throws AuthException emailAlreadyExists', () async {
      final fakeAuthRepository = FakeAuthRepository();
      fakeAuthRepository
          .backfillUsers({user1.id: user1}, {user1.id: password1});
      expect(
        () async {
          await fakeAuthRepository.signUp(
              email: user1.email!, phone: user1.phone!, password: password2);
        },
        throwsA(predicate((e) =>
            e is AuthException && e.type == AuthExceptionType.emailExists)),
      );
      await fakeAuthRepository.onDispose();
    });
    test('new user', () async {
      final fakeAuthRepository = FakeAuthRepository();
      final newUser = await fakeAuthRepository.signUp(
          email: user1.email!, phone: user1.phone!, password: password1);
      // We don't know the uid that's generated, just check email matches.
      expect(newUser.email, user1.email);
      await fakeAuthRepository.onDispose();
    });
  });

  group('get user stream', () {
    test('nothing received', () async {
      final fakeAuthRepository = FakeAuthRepository();
      fakeAuthRepository
          .backfillUsers({user1.id: user1}, {user1.id: password1});
      final subscription = fakeAuthRepository.user.listen((user) {
        fail('listener received an unexpected element: $user');
      });
      subscription.cancel();
      await fakeAuthRepository.onDispose();
    });
    test('receive user on login', () async {
      final fakeAuthRepository = FakeAuthRepository();
      fakeAuthRepository
          .backfillUsers({user1.id: user1}, {user1.id: password1});
      fakeAuthRepository.user.listen((user) {
        expect(user, equals(user1));
      });
      await fakeAuthRepository.loginWithEmailPassword(
          email: user1.email!, password: password1);
      await fakeAuthRepository.onDispose();
    });
  });

  group('logout', () {
    test('success returns isLoggedIn false', () async {
      final fakeAuthRepository = FakeAuthRepository();
      fakeAuthRepository
          .backfillUsers({user1.id: user1}, {user1.id: password1});
      fakeAuthRepository.setCurrentUser(user1);
      await fakeAuthRepository.logout();
      expect(fakeAuthRepository.isLoggedIn, equals(false));
      await fakeAuthRepository.onDispose();
    });
  });
  group('isLoggedIn', () {
    test('returns false', () {
      final fakeAuthRepository = FakeAuthRepository();
      expect(fakeAuthRepository.isLoggedIn, equals(false));
    });
    test('returns true', () async {
      final fakeAuthRepository = FakeAuthRepository();
      fakeAuthRepository
          .backfillUsers({user1.id: user1}, {user1.id: password1});
      await fakeAuthRepository.loginWithEmailPassword(
          email: user1.email!, password: password1);
      expect(fakeAuthRepository.isLoggedIn, equals(true));
      await fakeAuthRepository.onDispose();
    });
  });
  group('loginWithEmailPassword', () {
    test('throws AuthException with type userNotFound', () async {
      final fakeAuthRepository = FakeAuthRepository();
      expect(
        () async {
          await fakeAuthRepository.loginWithEmailPassword(
              email: user1.email!, password: password1);
        },
        throwsA(predicate((e) =>
            e is AuthException && e.type == AuthExceptionType.userNotFound)),
      );
      await fakeAuthRepository.onDispose();
    });
    test('throws AuthException with type alreadyLoggedIn', () async {
      final fakeAuthRepository = FakeAuthRepository();
      fakeAuthRepository.backfillUsers({user1.id: user1, user2.id: user2},
          {user1.id: password1, user2.id: password2});
      await fakeAuthRepository.loginWithEmailPassword(
          email: user1.email!, password: password1);
      expect(
        () async {
          await fakeAuthRepository.loginWithEmailPassword(
              email: user2.email!, password: password2);
        },
        throwsA(predicate((e) =>
            e is AuthException && e.type == AuthExceptionType.alreadyLoggedIn)),
      );
      await fakeAuthRepository.onDispose();
    });
    test('throws AuthException with type wrongPassword', () async {
      final fakeAuthRepository = FakeAuthRepository();
      fakeAuthRepository
          .backfillUsers({user1.id: user1}, {user1.id: password1});
      expect(
        () async {
          await fakeAuthRepository.loginWithEmailPassword(
              email: user1.email!, password: password2);
        },
        throwsA(predicate((e) =>
            e is AuthException && e.type == AuthExceptionType.wrongPassword)),
      );
      await fakeAuthRepository.onDispose();
    });
  });
}
