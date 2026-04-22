import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  String _message = "";
  final TextEditingController _controller = TextEditingController();

  Future<void> _sendMessage() async {
    final user = AuthService().currentUser;
    if (user != null && _message.trim().isNotEmpty) {
      await ChatService().saveMessage(_message, user);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: screenHeight / 2),
              child: TextField(
                controller: _controller,
                onChanged: (value) => setState(() => _message = value),
                decoration: InputDecoration(labelText: "Enviar mensagem..."),
                maxLines: null,
                keyboardType: TextInputType.multiline,
                scrollPhysics: ScrollPhysics(),
              ),
            ),
          ),
          IconButton(
            onPressed: _message.trim().isEmpty ? null : _sendMessage,
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
