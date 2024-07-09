class ChatMessage {
  final String name;
  final String message;
  final String imageUrl;
  final bool isVoice;
  final bool isUser;

  ChatMessage({
    required this.name,
    required this.message,
    required this.imageUrl,
    required this.isVoice,
    required this.isUser,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      name: json['name'],
      message: json['message'],
      imageUrl: json['imageUrl'],
      isVoice: json['isVoice'],
      isUser: json['isUser'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'message': message,
      'imageUrl': imageUrl,
      'isVoice': isVoice,
      'isUser': isUser,
    };
  }
}
