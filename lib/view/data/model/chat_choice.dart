import 'package:character_gpt/view/data/model/chat_delta.dart';
import 'package:character_gpt/view/data/model/chat_message.dart';
import 'package:character_gpt/view/data/model/usage.dart';

class ChatChoice {
  final ChatMessage? message;
  final String? model;
  final Usage? usage;
  final String? finishReason;
  final int? index;
  final ChatDelta? delta;

  ChatChoice({
    this.message,
    this.model,
    this.usage,
    this.finishReason,
    this.index,
    this.delta,
  });

  factory ChatChoice.fromJson(Map<String, dynamic> json) {
    return ChatChoice(
      message: json['message'] == null
          ? null
          : ChatMessage.fromJson(json['message'] as Map<String, dynamic>),
      model: json['model'] as String?,
      usage: json['usage'] == null
          ? null
          : Usage.fromJson(json['usage'] as Map<String, dynamic>),
      finishReason: json['finishReason'] as String?,
      index: json['index'] as int?,
      delta: json['delta'] == null
          ? null
          : ChatDelta.fromJson(json['delta'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'model': model,
      'usage': usage,
      'finishReason': finishReason,
      'index': index,
    };
  }
}
