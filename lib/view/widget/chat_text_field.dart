import 'package:character_gpt/view/data/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = context.read<ChatProvider>().textEditingController;
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 18),
          child: TextField(
              controller: textController,
              maxLines: 1,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '메세지를 적어주세요.',
                contentPadding: EdgeInsets.zero,
                hintStyle: TextStyle(
                  color: Color(0xFFB8B8B8),
                  fontWeight: FontWeight.w500,
                ),
              )),
        ),
      ),
    );
  }
}
