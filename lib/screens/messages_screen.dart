import 'dart:convert';

import 'package:chat_demo/models/message.dart';
import 'package:flutter/material.dart';
import 'package:chat_demo/widgets/canvas.dart';
import 'package:chat_demo/widgets/message_row.dart';

class ContactMessagesScreen extends StatelessWidget {
  final String username;
  final List<Message> messages;
  final DateTime? lastMessageDateTime;
  final void Function(List<Message>) updateMsgs;
  final void Function() dataFetched;
  final void Function(DateTime datetime) setLastDateTime;

  const ContactMessagesScreen(
      {super.key,
      required this.username,
      this.lastMessageDateTime,
      required this.dataFetched,
      required this.setLastDateTime,
      required this.updateMsgs,
      required this.messages});

  final String url = "http://146.185.154.90:8000/messages";

  @override
  Widget build(BuildContext context) {
    List<Widget> message_rows = [];

    for (var message in messages) {
      message_rows.add(
        MessageRow(
          author: message.author,
          text: message.message,
          sent: message.sentDisplay,
          byAuthor: message.author == username ? true : false,
        ),
      );
    }

    return MessengerCanvas(
        widget: Column(
      children: [
        Expanded(
          flex: 6,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Chat with a stranger",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                ...message_rows,
              ],
            ),
          ),
        ),
        // Expanded(
        //   child: TextField(
        //     decoration: InputDecoration(
        //         filled: true, fillColor: Color.fromRGBO(128, 128, 128, 1)),
        //   ),
        //   flex: 1,
        // )
      ],
    ));
  }
}
