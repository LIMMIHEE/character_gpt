import 'package:character_gpt/view/data/model/chat_choice.dart';
import 'package:character_gpt/view/data/model/usage.dart';

class ChatCompletionResponse {
  final String? id;
  final String? object;
  final int? created;
  final String? model;
  final Usage? usage;
  final List<ChatChoice>? choices;

  ChatCompletionResponse({
    this.id,
    this.object,
    this.created,
    this.model,
    this.usage,
    this.choices,
  });

  factory ChatCompletionResponse.fromJson(Map<String, dynamic> json) {
    return ChatCompletionResponse(
      id: json['id'] as String?,
      object: json['object'] as String?,
      created: json['created'] as int?,
      model: json['model'] as String?,
      usage: json['usage'] == null
          ? null
          : Usage.fromJson(json['usage'] as Map<String, dynamic>),
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => ChatChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'object': object,
      'created': created,
      'model': model,
      'usage': usage,
      'choices': choices,
    };
  }
}
