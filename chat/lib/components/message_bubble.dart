import 'dart:io';

import 'package:chat/core/models/chat_message.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool belongToCurrentUser;

  const MessageBubble({
    super.key,
    required this.message,
    required this.belongToCurrentUser,
  });

  double _calculateBubbleWidth(BuildContext context) {
    // Calcula largura baseada no texto da mensagem
    final textPainter = TextPainter(
      text: TextSpan(
        text: message.text,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout();

    final textWidth = textPainter.width;

    // Se o nome é mostrado (mensagens de outros usuários), considera sua largura
    double contentWidth = textWidth;
    if (!belongToCurrentUser) {
      final namePainter = TextPainter(
        text: TextSpan(
          text: message.userName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        textDirection: TextDirection.ltr,
        maxLines: 1,
      )..layout();

      final nameWidth = namePainter.width;
      contentWidth = textWidth > nameWidth ? textWidth : nameWidth;
    }

    // Adiciona apenas o padding horizontal (32 = 16 * 2)
    final totalWidth = contentWidth + 32;

    // Limita entre 80 e 280 pixels para mensagens muito curtas/longas
    return totalWidth.clamp(80.0, 280.0);
  }

  Widget _buildUserImage(String? imageUrl) {
    ImageProvider? imageProvider;
    final uri = Uri.tryParse(imageUrl ?? '');
    final placeholder = 'assets/images/placeholder.png';

    if (uri.toString().isEmpty) {
      imageProvider = AssetImage(placeholder);
    } else if (uri!.scheme.contains('http')) {
      imageProvider = NetworkImage(uri.toString());
    } else {
      imageProvider = FileImage(File(uri.toString()));
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: CircleAvatar(radius: 16, backgroundImage: imageProvider),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: belongToCurrentUser
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (!belongToCurrentUser) _buildUserImage(message.userImageUrl),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: belongToCurrentUser
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: belongToCurrentUser
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(12),
                    topRight: const Radius.circular(12),
                    bottomLeft: belongToCurrentUser
                        ? const Radius.circular(12)
                        : const Radius.circular(0),
                    bottomRight: belongToCurrentUser
                        ? const Radius.circular(0)
                        : const Radius.circular(12),
                  ),
                ),
                width: _calculateBubbleWidth(context),
                constraints: const BoxConstraints(minWidth: 120, maxWidth: 280),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: belongToCurrentUser
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    if (!belongToCurrentUser)
                      Column(
                        children: [
                          Text(
                            message.userName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    Text(
                      message.text,
                      style: const TextStyle(color: Colors.white),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (belongToCurrentUser) _buildUserImage(message.userImageUrl),
      ],
    );
  }
}
