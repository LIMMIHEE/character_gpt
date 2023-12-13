import 'package:character_gpt/view/data/provider/chat_provider.dart';
import 'package:character_gpt/view/widget/chat_list.dart';
import 'package:character_gpt/view/widget/chat_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Expanded(
              child: ChatList(),
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.zero,
                  child: Divider(
                    height: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      const Expanded(
                        child: ChatTextField(),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<ChatProvider>().sendChat();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 24),
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
