import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:teams/core/exceptions/auth_exception.dart';
import 'package:teams/domain/entities/user.dart';
import 'package:teams/domain/repositories/auth_repository.dart';
import 'package:uuid/uuid.dart';

class FakeAuthRepository implements AuthRepository, Disposable {
  FakeAuthRepository() {
    _userStreamController = StreamController<User?>.broadcast();
  }
  // Map from user Id to user.
  Map<String, User> _registeredUsers = {};

  // Map from user Id to their password.
  Map<String, String> _userPasswords = {};

  // Currently authenticated user.
  User? _currentUser;

  late StreamController<User?> _userStreamController;

  User? _findUserByEmail(String email) {
    try {
      return _registeredUsers.values.firstWhere((user) => user.email == email);
    } on StateError {
      return null;
    }
  }

  User? _findUserByPhone(String phone) {
    try {
      return _registeredUsers.values.firstWhere((user) => user.phone == phone);
    } on StateError {
      return null;
    }
  }

  @visibleForTesting
  void backfillUsers(
      Map<String, User> users, Map<String, String> uidToPassword) {
    _registeredUsers = users;
    _userPasswords = uidToPassword;
  }

  @visibleForTesting
  void setCurrentUser(User? user) {
    _currentUser = user;
  }

  @override
  User? get currentUser => _currentUser;

  @override
  bool get isLoggedIn => _currentUser != null;

  @override
  Future<User> loginWithEmailPassword(
      {required String email, required String password}) async {
    if (_currentUser != null) {
      throw const AuthException(type: AuthExceptionType.alreadyLoggedIn);
    }
    await Future.delayed(const Duration(seconds: 1));
    final user = _findUserByEmail(email);
    if (user != null) {
      if (_userPasswords[user.id] != password) {
        throw const AuthException(type: AuthExceptionType.wrongPassword);
      }
      _currentUser = user;
      _userStreamController.add(user);
      return user;
    }
    throw const AuthException(type: AuthExceptionType.userNotFound);
  }

  @override
  Future<User> loginWithPhonePassword(
      {required String phone, required String password}) async {
    if (_currentUser != null) {
      throw const AuthException(type: AuthExceptionType.alreadyLoggedIn);
    }
    await Future.delayed(const Duration(seconds: 1));
    final user = _findUserByPhone(phone);
    if (user != null) {
      if (_userPasswords[user.id] != password) {
        throw const AuthException(type: AuthExceptionType.wrongPassword);
      }
      _currentUser = user;
      _userStreamController.add(user);
      return user;
    }
    throw const AuthException(type: AuthExceptionType.userNotFound);
  }

  @override
  Future<void> logout() async {
    _currentUser = null;
    _userStreamController.add(null);
  }

  @override
  Future<User> signUp(
      {required String email,
      required String phone,
      required String password}) async {
    if (_currentUser != null) {
      throw const AuthException(type: AuthExceptionType.alreadyLoggedIn);
    }
    await Future.delayed(const Duration(seconds: 1));
    if (_findUserByEmail(email) != null) {
      throw const AuthException(type: AuthExceptionType.emailExists);
    }

    // Register and log in new user.
    final uid = const Uuid().v4();
    final newUser = User(id: uid, email: email);
    _registeredUsers[uid] = newUser;
    _userPasswords[uid] = password;
    _currentUser = newUser;
    _userStreamController.add(newUser);

    // Return new user that's logged in.
    return newUser;
  }

  @override
  Stream<User?> get user => _userStreamController.stream;

  @override
  FutureOr onDispose() {
    _userStreamController.close();
  }
}
