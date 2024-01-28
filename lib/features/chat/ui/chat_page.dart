import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_chat/features/chat/ui/message_input.dart';

import '../../../data/chat_messages_data.dart';
import '../../../functions/functions.dart';
import '../model/chat_message_model.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key, required this.chatID});


  final String chatID;
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Message>? _messages;

  TextEditingController _messageController = TextEditingController();
  ImagePicker _imagePicker = ImagePicker();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messages = chatData[widget.chatID];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),

        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              // Add your action here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages?.length ?? 0,
              reverse: true, // To display messages from bottom to top
              itemBuilder: (context, index) {
                final message = _messages![index];
                bool isMyMessage = message.userId == '777'; // Replace with your user ID

                // Check if a day has passed since the last message
                bool showDivider = index < _messages!.length - 1 &&
                    !isSameDay(_messages![index + 1].timestamp, message.timestamp);

                return Column(
                  children: [
                    if (showDivider) _buildDateDivider(message.timestamp),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: isMyMessage ? Colors.blue : Colors.grey[200],
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (message.image != null)
                                Container(
                                  height: 150.0,
                                  width: 150.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: FileImage(message.image!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              if (message.image == null)
                                Text(
                                  message.text,
                                  style: TextStyle(
                                    color: isMyMessage ? Colors.white : Colors.black,
                                    fontSize: 16.0,
                                  ),
                                ),
                              SizedBox(height: 4.0),
                              Text(
                                '${message.timestamp.hour}:${message.timestamp.minute}',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: isMyMessage ? Colors.white70 : Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          //buildMessageInput(_pickImage, _sendMessage ,_messageController ),
          _buildMessageInput()
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.attach_file),
            onPressed: () {
              _pickImage();
            },
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'Type your message...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 8.0),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              _sendMessage();
            },
          ),
        ],
      ),
    );
  }

  void _pickImage() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final newMessage = Message(
        userId: '777', // You can replace this with dynamic user ID
        text: '',
        timestamp: DateTime.now(),
        image: File(pickedFile.path),
      );

      setState(() {
        if (chatData.containsKey(widget.chatID)) {
          chatData[widget.chatID]!.insert(0, newMessage);
        } else {
          // Create a new chat if it doesn't exist
          chatData[widget.chatID] = [newMessage];
        }
      });
    }
  }

  void _sendMessage() {
    final messageText = _messageController.text;
    if (messageText.isNotEmpty) {
      final newMessage = Message(
        userId: '777', // You can replace this with dynamic user ID
        text: messageText,
        timestamp: DateTime.now(),
      );

      setState(() {
        if (chatData.containsKey(widget.chatID)) {
          chatData[widget.chatID]!.insert(0, newMessage);
        } else {
          // Create a new chat if it doesn't exist
          chatData[widget.chatID] = [newMessage];
        } // Insert at the beginning to maintain reverse order
        _messageController.clear();
      });
    }
  }

  Widget _buildDateDivider(DateTime timestamp) {
    String formattedDate = DateFormat.yMd().format(timestamp);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(
            formattedDate,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }

}