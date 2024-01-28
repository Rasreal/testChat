import 'package:flutter/material.dart';
import 'package:test_chat/data/chat_messages_data.dart';
import 'package:test_chat/features/chat/ui/chat_page.dart';
import 'package:test_chat/features/home/model/home_chats_model.dart';
import 'package:test_chat/styles/text_styles.dart';

import '../../../functions/functions.dart';

class ChatTile extends StatelessWidget {
  ChatTile({Key? key, required this.chatInfo}) : super(key: key);

  HomeChatsModel chatInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    backgroundColor: Colors.pinkAccent,
                    child: Text("${chatInfo.fName[0]}${chatInfo.lName[0]}"),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${chatInfo.fName} ${chatInfo.lName}",
                      style: nameStyle,

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if(getLatestUserId(chatData, chatInfo.chatId!) == "777")
                          Text("Вы: ", style: msgMe,),

                        Text(getLatestMessage(chatData!, chatInfo.chatId!)?.text ?? "", style: msgMe.copyWith(color: Colors.grey.shade500),),
                      ],
                    )
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(formatDateTime(chatInfo.lastMessaged,),style: defStyle,),
                    Text("")
                  ],
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Color.fromRGBO(169, 169, 169, 0.2),
            ),
          ],
        ),
    );
  }
}
