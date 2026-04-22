import 'package:chat/core/models/chat_notifications.dart';
import 'package:flutter/material.dart';

class ChatNotificationService with ChangeNotifier {
  final List<ChatNotifications> _notifications = [];

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
}
