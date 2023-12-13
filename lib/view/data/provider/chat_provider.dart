import 'package:character_gpt/view/data/model/chat_message.dart';
import 'package:character_gpt/view/data/repository/chat_repository.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ChatRepository _chatRepository = ChatRepository();
  final TextEditingController textController = TextEditingController();
  List<ChatMessage> chatMessage = [];

  String streamText = '';

  void sendChat() async {
    chatMessage = [
      ...chatMessage,
      ChatMessage(
          content: textController.text,
          messageType: MessageType.user,
          role: 'user',
          dateTime: DateTime.now().toString())
    ];
    notifyListeners();

    try {
      final response =
          await _chatRepository.sendMessage(chatMessage, textController.text);
      final newMessages = response?.map((e) => e.message!).toList();

      if (newMessages != null) {
        chatMessage = [...chatMessage, ...newMessages];
        notifyListeners();
      }
    } catch (_) {}
  }
}
