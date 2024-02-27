import 'package:teams/domain/entities/user.dart';

abstract class AuthRepository {
  /// Whether a user is currently logged in or not.
  bool get isLoggedIn;

  /// Login a user with the given credentials.
  Future<User> loginWithEmailPassword(
      {required String email, required String password});

  /// Logout.
  Future<void> logout();

  /// Stream of currently authenticated user. Null if no user is authenticated.
  Stream<User?> get user;

  /// Register a user.
  Future<User> signUp(
      {required String email, required String phone, required String password});

  /// The currently authenticated user.
  User? get currentUser;
}
