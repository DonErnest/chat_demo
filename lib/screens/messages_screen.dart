import 'package:flutter/material.dart';
import 'package:chat_demo/data.dart';
import 'package:chat_demo/enums.dart';
import 'package:chat_demo/widgets/canvas.dart';
import 'package:chat_demo/widgets/message_from_contact.dart';
import 'package:chat_demo/widgets/message_to_contact.dart';

class ContactMessagesScreen extends StatelessWidget {
  final void Function() backToMain;
  final int contactId;

  const ContactMessagesScreen({super.key, required this.contactId, required this.backToMain});

  Contact getContact(int contactId) {
    for (var contact in contacts) {
      if (contact.id == contactId) {
        return contact;
      }
    }
    return contacts[0];
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> message_rows = [];

    for (var message in messages) {
      if (message.direction == MessageDirection.toContact) {
        message_rows.add(MessageToContactRow(text: message.text));
      } else {
        message_rows.add(MessageFromContactRow(text: message.text));
      }
    }

    Contact contact = getContact(contactId);

    return MessengerCanvas(
        widget: Column(
      children: [
        Expanded(
          flex: 6,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        contact.name,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: backToMain,
                        child: Icon(
                          Icons.arrow_forward_sharp,
                          color: Color.fromRGBO(41, 41, 41, 1),
                        ),
                      )
                    ],
                  ),
                ),
                ...message_rows,
              ],
            ),
          ),
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
                filled: true, fillColor: Color.fromRGBO(128, 128, 128, 1)),
          ),
          flex: 1,
        )
      ],
    ));
  }
}
