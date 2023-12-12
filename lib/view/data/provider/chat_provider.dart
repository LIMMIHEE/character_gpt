import 'package:character_gpt/view/data/model/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final TextEditingController textEditingController = TextEditingController();
  final List<Message> chatMessage = [];
}