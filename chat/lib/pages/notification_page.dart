import 'package:chat/core/services/notification/chat_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChatNotificationService>(context);
    final notifications = provider.notifications;

    return Scaffold(
      appBar: AppBar(title: Text("Notificações"), centerTitle: true),
      body: SafeArea(
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return ListTile(
              title: Text(notification.title),
              subtitle: Text(notification.body),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  provider.removeNotificationByIndex(index);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
