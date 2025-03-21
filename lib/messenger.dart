import 'dart:ffi';

import 'package:chat_demo/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_demo/enums.dart';
import 'package:chat_demo/screens/messages_screen.dart';

import 'models/destination.dart';

class MessengerPrototype extends StatefulWidget {
  const MessengerPrototype({super.key});

  @override
  State<MessengerPrototype> createState() => _MessengerPrototypeState();
}

class _MessengerPrototypeState extends State<MessengerPrototype> {
  Screen curScreen = Screen.login;
  String username = "";

  void loginSet(String login) {
    setState(() {
      username = login;
      curScreen = Screen.contact;
    });
  }

  void logout() {
    setState(() {
      curScreen = Screen.login;
      username = "";
    });
  }


  List<Destination> get destinations =>
      [
        Destination(
            screen: Screen.login,
            appBarTitle: Text("Login", style: TextStyle(color: Colors.white),),
            appBarActions: [],
            body: LoginScreen(onLoginEntered: loginSet)
        ),
        Destination(
            screen: Screen.contact,
            appBarTitle: Text(
              username, style: TextStyle(color: Colors.white),),
            appBarActions: [
              IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: logout,
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(
                      Color.fromRGBO(255, 163, 26, 1)),
                  foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                ),
              ),
            ],
            body: ContactMessagesScreen(username: username,)
        )
      ];

  Destination getCurrentDestination(Screen screen) {
    return destinations.firstWhere((dest) => dest.screen == screen);
  }

  @override
  Widget build(BuildContext context) {
    var destination = getCurrentDestination(curScreen);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: destination.appBarTitle,
          actions: destination.appBarActions,
        ),
        body: destination.body,
      ),
    );
  }
}
