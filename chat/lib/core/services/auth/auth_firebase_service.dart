import 'dart:async';
import 'dart:io';

import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthFirebaseService implements AuthService {
  static ChatUser? _currentUser;
  static final Stream<ChatUser?> _authStateStream = Stream<ChatUser?>.multi((
    controller,
  ) async {
    final authChanges = FirebaseAuth.instance.authStateChanges();

    await for (final user in authChanges) {
      _currentUser = _mapFirebaseUserToChatUser(user);
      controller.add(_currentUser);
    }
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
    final signup = await Firebase.initializeApp(
      name: 'userSignup',
      options: Firebase.app().options,
    );

    final auth = FirebaseAuth.instanceFor(app: signup);

    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (userCredential.user == null) return;

    await userCredential.user!.updateDisplayName(name);
    final chatUser = _mapFirebaseUserToChatUser(userCredential.user, name);
    await _saveChatUser(chatUser);
  }

  @override
  Future<void> login({required String email, required String password}) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
  }

  Future<void> _saveChatUser(ChatUser? user) async {
    if (user == null) return;

    final store = FirebaseFirestore.instance;
    final userDoc = store.collection('users').doc(user.id);

    await userDoc.set({
      'name': user.name,
      'email': user.email,
      'imageUrl': user.imageUrl,
    });
  }

  static ChatUser? _mapFirebaseUserToChatUser(User? user, [String? name]) {
    if (user == null) return null;

    return ChatUser(
      id: user.uid,
      name: name ?? user.displayName ?? user.email?.split('@').first ?? '',
      email: user.email ?? '',
      imageUrl: user.photoURL ?? 'assets/images/avatar.png',
    );
  }
}
