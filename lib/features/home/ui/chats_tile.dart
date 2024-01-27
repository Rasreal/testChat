import 'package:flutter/material.dart';
import 'package:test_chat/features/home/model/home_chats_model.dart';
import 'package:test_chat/styles/text_styles.dart';

class ChatTile extends StatelessWidget {
  ChatTile({Key? key, required this.chatInfo}) : super(key: key);

  HomeChatsModel chatInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: [
            CircleAvatar(
              child: Image.network(chatInfo.imageUrl),
            ),
            Column(
              children: [
                Text(
                  "${chatInfo.fName} ${chatInfo.lName}",
                  style: nameStyle,
                )
              ],
            )
          ],
        ),
    );
  }
}
