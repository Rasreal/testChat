import 'package:flutter/material.dart';

Widget buildMessageInput(Function pickImg, Function sendMsg, TextEditingController msgController) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        IconButton(
          icon: Icon(Icons.attach_file),
          onPressed: () {
            pickImg();
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
                controller: msgController,
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
            sendMsg();
          },
        ),
      ],
    ),
  );
}