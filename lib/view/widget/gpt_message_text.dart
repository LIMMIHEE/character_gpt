import 'package:character_gpt/view/data/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GptMessageText extends StatefulWidget {
  const GptMessageText({super.key});

  @override
  State<GptMessageText> createState() => _GptMessageTextState();
}

class _GptMessageTextState extends State<GptMessageText>
    with TickerProviderStateMixin {
  late Animation<int> textCount;
  late AnimationController animationController;

  void initAnimation() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    animationController.addListener(() => setState);
  }

  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  @override
  Widget build(BuildContext context) {
    final message =
        context.select((ChatProvider provider) => provider.streamText);
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Text(message);
        });
  }
}
