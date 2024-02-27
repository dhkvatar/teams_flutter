import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:teams/core/exceptions/auth_exception.dart';
import 'package:teams/core/exceptions/mappers/firebase_auth_exception_mapper.dart';
import 'package:teams/domain/entities/mappers/firebase_auth_user_mapper.dart';
import 'package:teams/domain/entities/user.dart' as app;
import 'package:teams/domain/repositories/auth_repository.dart';

// @LazySingleton(as: AuthRepository)
class FirebaseAuthRepository implements AuthRepository {
  final fbAuth = firebase.FirebaseAuth.instance;

  @override
  app.User? get currentUser {
    final fbUser = fbAuth.currentUser;
    return fbUser != null ? FirebaseAuthUserMapper.map(fbUser) : null;
  }

  @override
  bool get isLoggedIn => fbAuth.currentUser != null;

  @override
  Future<app.User> loginWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final userCredential = await fbAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user == null) {
        throw const AuthException(type: AuthExceptionType.unknown);
      }
      return FirebaseAuthUserMapper.map(userCredential.user!);
    } on firebase.FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionMapper.map(e);
    } on Exception {
      throw const AuthException(type: AuthExceptionType.unknown);
    }
  }

  @override
  Future<void> logout() async {
    await fbAuth.signOut();
  }

  @override
  Future<app.User> signUp(
      {required String email,
      required String phone,
      required String password}) async {
    try {
      final userCredential = await fbAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user;
      if (user == null) {
        throw const AuthException(type: AuthExceptionType.unknown);
      }
      return FirebaseAuthUserMapper.map(user);
    } on firebase.FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionMapper.map(e);
    } on Exception {
      throw const AuthException(type: AuthExceptionType.unknown);
    }
  }

  @override
  Stream<app.User?> get user => fbAuth.userChanges().map(
      (fbUser) => fbUser != null ? FirebaseAuthUserMapper.map(fbUser) : null);
}
