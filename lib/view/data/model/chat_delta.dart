class ChatDelta {
  String? content;

  ChatDelta({
    this.content,
  });

  factory ChatDelta.fromJson(Map<String, dynamic> json) {
    return ChatDelta(
      content: json['content'] as String?,
    );
  }
}
