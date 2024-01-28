class HomeChatsModel{
  final String id;
  final String fName;
  final String lName;
  final bool lastMessagedMe;
  final DateTime lastMessaged;
  final String imageUrl;
  final String chatId;

  HomeChatsModel({
    required this.id,
    required this.fName,
    required this.lName,
    required this.lastMessagedMe,
    required this.lastMessaged,
    required this.imageUrl,
    required this.chatId,
  });
}