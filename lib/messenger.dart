import 'package:flutter/material.dart';
import 'package:chat_demo/enums.dart';
import 'package:chat_demo/screens/main_screen.dart';
import 'package:chat_demo/screens/messages_screen.dart';

class MessengerPrototype extends StatefulWidget {
  const MessengerPrototype({super.key});

  @override
  State<MessengerPrototype> createState() => _MessengerPrototypeState();
}

class _MessengerPrototypeState extends State<MessengerPrototype> {
  Screen curScreen = Screen.main;
  int? curContact;

  void browseContact(int contactId) {
    setState(() {
      curScreen = Screen.contact;
      curContact = contactId;
    });
  }

  void backToMain() {
    setState(() {
      curScreen = Screen.main;
      curContact = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = MainScreen(goToContact: browseContact,);

    if (curScreen == Screen.contact) {
      screen = ContactMessagesScreen(contactId: curContact!, backToMain: backToMain,);
    };

    return MaterialApp(
      home: Scaffold(
        body: screen,
      ),
    );
  }
}
