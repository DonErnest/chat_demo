import 'package:flutter/material.dart';
import 'package:chat_demo/enums.dart';
import 'package:chat_demo/screens/messages_screen.dart';

class MessengerPrototype extends StatefulWidget {
  const MessengerPrototype({super.key});

  @override
  State<MessengerPrototype> createState() => _MessengerPrototypeState();
}

class _MessengerPrototypeState extends State<MessengerPrototype> {
  Screen curScreen = Screen.contact;
  String username = "Unabomber";

  @override
  Widget build(BuildContext context) {
    Widget screen = ContactMessagesScreen(username: username,);

    return MaterialApp(
      home: Scaffold(
        body: screen,
      ),
    );
  }
}
