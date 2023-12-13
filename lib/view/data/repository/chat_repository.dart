import 'dart:convert';
import 'dart:io';

import 'package:character_gpt/view/data/model/chat_choice.dart';
import 'package:character_gpt/view/data/model/chat_completion_response.dart';
import 'package:character_gpt/view/data/model/chat_message.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatRepository {
  final Dio _dioClient = Dio(BaseOptions(
    baseUrl: 'https://api.openai.com/',
    headers: {
      HttpHeaders.authorizationHeader: "Bearer ${dotenv.env['API_KEY'] ?? ''}",
    },
    contentType: 'application/json',
    followRedirects: false,
  ));

  Future<List<ChatChoice>?> sendMessage(
      List<ChatMessage> messages, String content) async {
    try {
      final beforeMessages = messages.map((e) => e.toJson()).toList();
      final response =
          await _dioClient.post<Map<String, dynamic>>('v1/chat/completions',
              data: json.encode({
                "model": "gpt-3.5-turbo",
                "messages": [
                  ...beforeMessages,
                  ChatMessage().toMap(content: content, role: 'user')
                ],
                "temperature": 1,
                "max_tokens": 256,
                "top_p": 1,
                "frequency_penalty": 0,
                "presence_penalty": 0
              }));
      ChatCompletionResponse convertResponse =
          ChatCompletionResponse.fromJson(response.data!);

      return convertResponse.choices;
    } catch (_) {}
  }
  
}
