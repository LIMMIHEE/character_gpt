import 'package:character_gpt/view/data/model/chat_message.dart';
import 'package:character_gpt/view/data/repository/chat_repository.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ChatRepository _chatRepository = ChatRepository();
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  List<ChatMessage> chatMessage = [];

  String streamText = '';
  bool isLoading = false;

  void sendChat() async {
    chatMessage = [
      ...chatMessage,
      ChatMessage(
          content: textController.text,
          messageType: MessageType.user,
          role: 'user',
          dateTime: DateTime.now().toString()),
      ChatMessage(
          role: 'assistant', dateTime: DateTime.now().toString())
    ];
    streamText = '';
    textController.text  = '';
    notify();

    isLoading = true;
    try {
      _chatRepository.sendMessage(chatMessage, textController.text, (answer){
        final newAnswer = chatMessage.last.content += answer;
        streamText = newAnswer;
        chatMessage.last.content= newAnswer;
        notify();
      });
    } catch (_) {}
    isLoading = false;
  }


  void notify(){
    notifyListeners();
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 50), curve: Curves.bounceIn);
  }
}
