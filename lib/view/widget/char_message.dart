import 'package:character_gpt/view/widget/gpt_message_text.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    super.key,
    required this.isMyMessage,
    required this.dateTime,
    required this.message,
    required this.lastMessage,
  });

  final String message;
  final String dateTime;
  final bool isMyMessage;
  final bool lastMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
      child: Column(
        crossAxisAlignment:
            isMyMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                  color:
                      isMyMessage ? Colors.grey.withOpacity(0.3) : Colors.white,
                  borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 17),
              child: (!isMyMessage && lastMessage)
                  ? const GptMessageText()
                  : Text(
                      message,
                      style: const TextStyle(height: 1.4),
                    )),
          Text(
            formatDate(DateTime.parse(dateTime)),
            style: const TextStyle(
              color: Color(0xFF868686),
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }

  String formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    if (difference.inMinutes < 1) {
      return '방금 전';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes} 분전';
    } else if (difference.inDays < 1) {
      return '${difference.inHours} 시간 전';
    } else {
      return '${date.year}.${date.month}.${date.day}';
    }
  }
}
