import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:chat_demo/enums.dart';
import 'package:chat_demo/screens/messages_screen.dart';
import 'package:http/http.dart';

import 'models/message.dart';

class MessengerPrototype extends StatefulWidget {
  const MessengerPrototype({super.key});

  @override
  State<MessengerPrototype> createState() => _MessengerPrototypeState();
}

class _MessengerPrototypeState extends State<MessengerPrototype> {
  Screen curScreen = Screen.contact;
  String username = "Unabomber";

  List<Message> messages = [];
  DateTime? lastMessageDateTime;
  bool? isFetching;
  final String url = "http://146.185.154.90:8000/messages";

  Future<dynamic> fetchMessages() async {
    final uri = lastMessageDateTime != null
        ? Uri.parse('${url}?datetime=${lastMessageDateTime!.toIso8601String()}')
        : Uri.parse(url);
    try {
      final response = await get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData;
      }
    } catch (error) {
      return [];
    }
  }

  Future<void> getMessages() async {
    final rawData = await fetchMessages();
    if (rawData.length != 0) {
      var newMessages = List<Message>.from(rawData.map((json) => Message.fromJson(json)).toList());
      messages = messages + newMessages;

      if (messages.length > 0) {
        setLastDateTime(messages.last.datetime);
      }
    } else {}
    ;
    dataFetched();
  }

  @override
  void initState() {
    super.initState();
    getMessages();
  }

  void dataFetched() {
    setState(() {
      isFetching = false;
    });
  }

  void setLastDateTime(DateTime datetime) {
    setState(() {
      lastMessageDateTime = datetime;
    });
  }

  void updateMessages(List<Message> newMessages) {
    setState(() {
      messages = messages + newMessages;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = ContactMessagesScreen(
        username: username,
        messages: messages,
        updateMsgs: updateMessages,
        dataFetched: dataFetched,
        setLastDateTime: setLastDateTime);

    return MaterialApp(
      home: Scaffold(
        body: isFetching != null && isFetching!
            ? Center(child: CircularProgressIndicator())
            : screen,
      ),
    );
  }
}
