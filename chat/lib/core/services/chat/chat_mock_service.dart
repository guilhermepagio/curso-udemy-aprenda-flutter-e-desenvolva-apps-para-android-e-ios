import 'dart:async';
import 'dart:math';

import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _messages = [
    ChatMessage(
      id: "1",
      text: "Olá! Como posso ajudar você hoje?",
      createdAt: DateTime.now().subtract(Duration(minutes: 5)),
      userId: "1",
      userName: "Guilherme",
      userImageUrl: "https://avatars.githubusercontent.com/u/116508581?v=4",
    ),
    ChatMessage(
      id: "2",
      text: "Alguém poderia me ajudar?",
      createdAt: DateTime.now().subtract(Duration(minutes: 3)),
      userId: "user1",
      userName: "João",
      userImageUrl: "https://cdn-icons-png.flaticon.com/512/149/149072.png",
    ),
    ChatMessage(
      id: "3",
      text: "Já conseguiram me ajuda. Obrigado!",
      createdAt: DateTime.now().add(Duration(hours: 3)),
      userId: "user2",
      userName: "Maria",
      userImageUrl: "https://cdn-icons-png.flaticon.com/512/149/149073.png",
    ),
  ];

  static MultiStreamController<List<ChatMessage>>? _controller;
  static final Stream<List<ChatMessage>> _messagesStream =
      Stream<List<ChatMessage>>.multi((controller) {
        _controller = controller;
        controller.add(_messages);
      });

  @override
  Stream<List<ChatMessage>> messagesStream() {
    return _messagesStream;
  }

  @override
  Future<ChatMessage> saveMessage(String message, ChatUser user) async {
    final chatMessage = ChatMessage(
      id: Random().nextDouble().toString(),
      text: message,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageUrl: user.imageUrl,
    );

    _messages.add(chatMessage);
    _controller?.add(_messages);

    return chatMessage;
  }
}
