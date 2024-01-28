import 'dart:io';

class Message {
  final String userId;
  final String text;
  final DateTime timestamp;
  final File? image;

  Message({
    required this.userId,
    required this.text,
    required this.timestamp,
    this.image,
  });
}