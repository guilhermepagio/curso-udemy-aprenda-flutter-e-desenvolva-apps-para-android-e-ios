import 'package:chat/core/models/chat_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatNotificationService with ChangeNotifier {
  final List<ChatNotifications> _notifications = [];
  bool _isInitialized = false;

  List<ChatNotifications> get notifications => [..._notifications];

  int get notificationCount => _notifications.length;

  addNotification(ChatNotifications notification) {
    _notifications.add(notification);
    notifyListeners();
  }

  void removeNotificationByIndex(int index) {
    _notifications.removeAt(index);
    notifyListeners();
  }

  Future<void> initialize() async {
    if (_isInitialized) return;

    final bool authorized = await _isAutorized;

    await _configureTerminatedNotifications();

    if (authorized) {
      _configureForegroundNotifications();
      _configureBackgroundNotifications();
    }

    _isInitialized = true;
  }

  Future<bool> get _isAutorized async {
    final messaging = FirebaseMessaging.instance;
    final settings = await messaging.requestPermission();
    return settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional;
  }

  void _configureForegroundNotifications() {
    FirebaseMessaging.onMessage.listen(_messageHandler);
  }

  void _configureBackgroundNotifications() {
    FirebaseMessaging.onMessageOpenedApp.listen(_messageHandler);
  }

  Future<void> _configureTerminatedNotifications() async {
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    _messageHandler(initialMessage);
  }

  void _messageHandler(RemoteMessage? message) {
    if (message == null || message.notification == null) return;

    addNotification(
      ChatNotifications(
        title: message.notification?.title ?? 'Sem Título',
        body: message.notification?.body ?? 'Sem Corpo',
      ),
    );
  }
}
