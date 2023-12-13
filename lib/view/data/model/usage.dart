class Usage {
  final int? promptTokens;
  final int? completionTokens;
  final int? totalTokens;

  Usage({
    this.promptTokens,
    this.completionTokens,
    this.totalTokens,
  });

  factory Usage.fromJson(Map<String, dynamic> json) {
    return Usage(
      promptTokens: json['promptTokens'] as int?,
      completionTokens: json['completionTokens'] as int?,
      totalTokens: json['totalTokens'] as int?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'promptTokens': promptTokens,
      'completionTokens': completionTokens,
      'totalTokens': totalTokens,
    };
  }
}
