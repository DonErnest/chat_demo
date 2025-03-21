import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:chat_demo/enums.dart';
import 'package:chat_demo/screens/messages_screen.dart';
import 'package:http/http.dart';

import 'api.dart';
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
  bool needsScroll = false;

  Timer? _timer;

  Future<dynamic> fetchMessages() async {
    final uri = lastMessageDateTime != null
        ? Uri.parse(
            '${url}?datetime=${lastMessageDateTime!.toUtc().toIso8601String()}')
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
      setState(() {
        var newMessages = List<Message>.from(
            rawData.map((json) => Message.fromJson(json)).toList());
        if (newMessages.isNotEmpty) {
          lastMessageDateTime = newMessages.last.datetime;
          needsScroll = true;
        }
        messages = messages + newMessages;
      });
    }
    ;
  }

  void startFetching() async {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) async {
      await getMessages();
      print(
          "messages fetched, ${messages.length}, last: ${messages.last.datetime}");
    });
  }

  @override
  void initState() {
    super.initState();
    startFetching();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void dataFetched() {}

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
    );

    return MaterialApp(
      home: Scaffold(
        body: screen,
      ),
    );
  }
}
