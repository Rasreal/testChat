import 'dart:math';

import '../features/chat/model/chat_message_model.dart';

String formatDateTime(DateTime dateTime) {
  DateTime now = DateTime.now();
  Duration difference = now.difference(dateTime);

  if (difference.inSeconds < 60) {
    return 'только что';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
  } else if (difference.inHours <=6 && now.day == dateTime.day) {
    return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
  }else if (difference.inDays == 0) {
    return '${dateTime.hour}:${dateTime.minute}';
  } else if (difference.inDays == 1) {
    return 'вчера';
  } else {
    return '${dateTime.day.toString().padLeft(2, '0')}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.year}';
  }
}

bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;}

Message? getLatestMessage(Map<String, List<Message>> chatData, String chatId) {
  if (chatData.containsKey(chatId) && chatData[chatId]!.isNotEmpty) {
    List<Message> sortedMessages = List.from(chatData[chatId]!);
    sortedMessages.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    // Return the latest message
    return sortedMessages.first;
  }
  return null; // Return null if chat ID is not found or no messages in the chat
}

String? getLatestUserId(Map<String, List<Message>> chatData, String chatId) {
  if (chatData.containsKey(chatId) && chatData[chatId]!.isNotEmpty) {
    // Sort messages by timestamp in descending order
    List<Message> sortedMessages = List.from(chatData[chatId]!);
    sortedMessages.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    // Return the userId of the latest message
    return sortedMessages.first.userId;
  }
  return null; // Return null if chat ID is not found or no messages in the chat
}