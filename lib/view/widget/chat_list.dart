import 'package:character_gpt/view/data/model/chat_message.dart' as model;
import 'package:character_gpt/view/data/provider/chat_provider.dart';
import 'package:character_gpt/view/widget/char_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    final chatMessage = context.select((ChatProvider provider) => provider.chatMessage);

    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: chatMessage.length,
        itemBuilder: (context, index) {
          final message = chatMessage[index];

          return ChatMessage(
            isMyMessage: message.messageType == model.MessageType.user,
            message: message.content,
            dateTime: message.dateTime,
          );
        });
  }
}
