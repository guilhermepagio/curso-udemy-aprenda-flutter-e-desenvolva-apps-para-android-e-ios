import 'dart:async';
import 'dart:io';

import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/auth/auth_service.dart';

class AuthMockService implements AuthService {
  static final ChatUser _defaultUser = ChatUser(
    id: '1',
    name: 'Guilherme',
    email: 'guilherme@example.com',
    imageUrl: 'assets/images/avatar.png',
  );

  static final Map<String, ChatUser> _users = {
    _defaultUser.email: _defaultUser,
  };
  static ChatUser? _currentUser;
  static MultiStreamController<ChatUser?>? _authStateController;
  static final Stream<ChatUser?> _authStateStream = Stream<ChatUser?>.multi((
    controller,
  ) {
    _authStateController = controller;
    _updateAuthState(_defaultUser);
  });

  @override
  ChatUser? get currentUser => _currentUser;

  @override
  Stream<ChatUser?> get authStateChanges => _authStateStream;

  @override
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required File? image,
  }) async {
    final user = ChatUser(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      imageUrl: image?.path ?? 'assets/images/avatar.png',
    );

    _users.putIfAbsent(email, () => user);
    _updateAuthState(user);
  }

  @override
  Future<void> login({required String email, required String password}) async {
    _updateAuthState(_users[email]);
  }

  @override
  Future<void> logout() async {
    _updateAuthState(null);
  }

  static void _updateAuthState(ChatUser? user) {
    _currentUser = user;
    _authStateController?.add(user);
  }
}
