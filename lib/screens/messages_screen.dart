import 'package:chat_demo/models/message.dart';
import 'package:flutter/material.dart';
import 'package:chat_demo/enums.dart';
import 'package:chat_demo/widgets/canvas.dart';
import 'package:chat_demo/widgets/message_from_contact.dart';
import 'package:chat_demo/widgets/message_to_contact.dart';

class ContactMessagesScreen extends StatelessWidget {
  final String username;

  const ContactMessagesScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    List<Widget> message_rows = [];

    for (var message in messages) {
      if (message.author != username) {
        message_rows.add(MessageToContactRow(text: message.message));
      } else {
        message_rows.add(MessageFromContactRow(text: message.message));
      }
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
