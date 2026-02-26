class MessageModel {
  final String name;
  final String lastMessage;
  final String time;
  final bool isVerified;
  final bool isUnread;

  MessageModel({
    required this.name,
    required this.lastMessage,
    required this.time,
    this.isVerified = false,
    this.isUnread = false,
  });
}

