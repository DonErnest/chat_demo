import 'package:flutter/material.dart';
import 'package:chat_demo/data.dart';
import 'package:chat_demo/widgets/contact_row.dart';
import 'package:chat_demo/widgets/canvas.dart';

class MainScreen extends StatelessWidget {
  final Function(int contactId) goToContact;

  const MainScreen({super.key, required this.goToContact});

  @override
  Widget build(BuildContext context) {
    List<ContactRow> contactrows = [];

    for (var contact in contacts) {
      contactrows.add(ContactRow(
        contact: contact,
        checkMessages: goToContact,
      ));
    }

    return MessengerCanvas(
      widget: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...contactrows,
          ],
        ),
      ),
    );
  }
}
