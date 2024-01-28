import '../features/chat/model/chat_message_model.dart';

Map<String, List<Message>> chatData = {
  "chat_1234": [
    Message(userId: '777', text: 'Hello!', timestamp: DateTime.now().subtract(Duration(days: 1))),
    Message(userId: '1', text: 'Hi there!', timestamp: DateTime.now().subtract(Duration(hours: 23))),
    Message(userId: '777', text: 'How are you?', timestamp: DateTime.now().subtract(Duration(hours: 22))),
    Message(userId: '1', text: 'I\'m good. Thanks!', timestamp: DateTime.now().subtract(Duration(hours: 21))),
    Message(userId: 'User 1', text: 'What\'s up?', timestamp: DateTime.now().subtract(Duration(hours: 1))),
  ],
  "chat_1235": [
    Message(userId: '777', text: 'Hello!', timestamp: DateTime.now().subtract(Duration(days: 1))),
    Message(userId: '2', text: 'Hi there!', timestamp: DateTime.now().subtract(Duration(hours: 23))),
    Message(userId: '777', text: 'How are you?', timestamp: DateTime.now().subtract(Duration(hours: 22))),
    Message(userId: '2', text: 'I\'m bad :( u?', timestamp: DateTime.now().subtract(Duration(hours: 21))),
  ],
  "chat_1236": [
    Message(userId: '777', text: 'GM!', timestamp: DateTime.now().subtract(Duration(days: 1))),
    Message(userId: '3', text: 'Hi Yers!', timestamp: DateTime.now().subtract(Duration(hours: 23))),
    Message(userId: '777', text: 'Kak ty?', timestamp: DateTime.now().subtract(Duration(hours: 22))),
    Message(userId: '3', text: 'Norma', timestamp: DateTime.now().subtract(Duration(hours: 21))),
  ],
  "chat_1237": [
    Message(userId: '777', text: 'GN!', timestamp: DateTime.now().subtract(Duration(days: 1))),
    Message(userId: '4', text: 'Hi Yers!', timestamp: DateTime.now().subtract(Duration(hours: 23))),
    Message(userId: '777', text: 'Any News?', timestamp: DateTime.now().subtract(Duration(hours: 22))),
  ],
  "chat_1238": [
    Message(userId: '777', text: 'GM 8 9 0 - 123!', timestamp: DateTime.now().subtract(Duration(days: 1))),
    Message(userId: '5', text: 'Hi Yersultan!', timestamp: DateTime.now().subtract(Duration(hours: 23))),
    Message(userId: '777', text: 'Hello Bekarys', timestamp: DateTime.now().subtract(Duration(hours: 22))),
  ],
  // Add more chats as needed
};