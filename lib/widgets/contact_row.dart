import 'package:flutter/material.dart';
import 'package:chat_demo/data.dart';

class ContactRow extends StatelessWidget {
  final Function(int contactId) checkMessages;

  final Contact contact;

  const ContactRow({super.key, required this.contact, required this.checkMessages});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(
              "assets/avatars/${contact.avatar}",
            ),
          ),
          SizedBox(width: 15),
          Text(
            contact.name,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          Spacer(),
          ElevatedButton(
              onPressed: () => {checkMessages(contact.id)},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(255, 163, 26, 1)
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                    Icons.arrow_forward_sharp,
                    color: Color.fromRGBO(41, 41, 41, 1),

                ),
              ))
        ],
      ),
    );
  }
}
