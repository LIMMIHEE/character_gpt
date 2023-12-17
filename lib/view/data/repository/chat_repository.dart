import 'dart:convert';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:http/http.dart' as http;

import 'package:character_gpt/view/data/model/chat_completion_response.dart';
import 'package:character_gpt/view/data/model/chat_message.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatRepository {
  final gemini = Gemini.instance;
  String gptAnswer = '';

  void sendMessage(List<ChatMessage> messages, String content,
      Function(String) returnAnswer) {
    try {
      final beforeMessages = messages.map((e) => e.toJson()).toList();
      final client = http.Client();
      var request = http.Request(
        'POST',
        Uri.parse('https://api.openai.com/v1/chat/completions'),
      );
      request.body = json.encode({
        'model': 'gpt-3.5-turbo',
        'messages': [
          ...beforeMessages,
          ChatMessage().toMap(content: content, role: 'user')
        ],
        "stream": true
      });
      request.headers.addAll({
        'content-type': 'application/json',
        'authorization': 'Bearer ${dotenv.env['OPEN_AI_API_KEY'] ?? ''}',
        'accept': 'text/event-stream',
      });
      Future<http.StreamedResponse> response = client.send(request);

      response.asStream().listen((data) {
        data.stream
            .transform(const Utf8Decoder())
            .transform(const LineSplitter())
            .listen(
          (dataLine) {
            if (dataLine.isEmpty || dataLine == 'data: [DONE]') {
              if (dataLine == 'data: [DONE]') textEmotionClassification();
              return;
            }

            final map = dataLine.replaceAll('data: ', '');
            Map<String, dynamic> data = json.decode(map);

            ChatCompletionResponse chatData =
                ChatCompletionResponse.fromJson(data);

            final message = chatData.choices?.first.delta?.content ?? '';
            gptAnswer += message;
            returnAnswer(message);
          },
        );
      });
    } catch (e) {
      rethrow;
    }
  }

  void textEmotionClassification() {
    gemini
        .text("'$gptAnswer' ${dotenv.env['GEMINI_PROMPT'] ?? ''}")
        .then((value) => print(value?.output));

    gptAnswer = '';
  }

}
