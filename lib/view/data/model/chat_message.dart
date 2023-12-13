enum MessageType { bot, user }

class ChatMessage {
  MessageType messageType = MessageType.bot;
  String dateTime = '';
  String role = 'assistant';
  String content = '';

  ChatMessage(
      {this.messageType = MessageType.bot,
      this.dateTime = '',
      this.role = 'assistant',
      this.content = ''});

  ChatMessage.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    role = json['role'] ?? 'assistant';
    dateTime = DateTime.now().toString();
    messageType = MessageType.bot;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['content'] = content;
    data['role'] = role;

    return data;
  }

  Map<String, dynamic> toMap({required String content, required String role}) {
    final data = <String, dynamic>{};

    data['content'] = content;
    data['role'] = role;

    return data;
  }
}
