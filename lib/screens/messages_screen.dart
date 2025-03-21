import 'dart:async';

import 'package:chat_demo/api.dart';
import 'package:chat_demo/models/message.dart';
import 'package:flutter/material.dart';
import 'package:chat_demo/widgets/canvas.dart';
import 'package:chat_demo/widgets/message_row.dart';
import 'package:http/http.dart';

class ContactMessagesScreen extends StatefulWidget {
  final String username;

  const ContactMessagesScreen({
    super.key,
    required this.username,
  });

  @override
  State<ContactMessagesScreen> createState() => _ContactMessagesScreenState();
}

class _ContactMessagesScreenState extends State<ContactMessagesScreen> {
  late final ScrollController _scrollController;
  late final TextEditingController _messageTextController;

  String? newMessage;

  List<Message> messages = [];
  DateTime? lastMessageDateTime;
  bool needsScroll = false;

  Timer? _timer;

  Future<void> getMessages() async {
    final rawData = await fetchMessages(lastMessageDateTime);
    if (rawData.length != 0) {
      setState(() {
        var newMessages = List<Message>.from(
            rawData.map((json) => Message.fromJson(json)).toList());
        if (newMessages.isNotEmpty) {
          lastMessageDateTime = newMessages.last.datetime;
          needsScroll = true;
        }
        messages = messages + newMessages;
        if (needsScroll) {
          WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToEnd());
          needsScroll = false;
        }
      });
    }
    ;
  }

  void startFetching() async {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) async {
      await getMessages();
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _messageTextController = TextEditingController();
    super.initState();
    startFetching();
  }

  Future<void> sentMessage() async {
    if (newMessage != null) {
      await post(Uri.parse(url), body: {
        "message": newMessage,
        "author": widget.username
      });
      newMessage = null;
      _messageTextController.text = "";
    }
  }

  Future<void> _scrollToEnd() async {
    if (_scrollController.hasClients) {
      await _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MessengerCanvas(
      widget: Column(
        children: [
          Expanded(
            flex: 5,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (ctx, idx) => MessageRow(
                author: messages[idx].author,
                text: messages[idx].message,
                sent: messages[idx].sentDisplay,
                byAuthor:
                    messages[idx].author == widget.username ? true : false,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _messageTextController,
                    onChanged: (value) => {
                      setState(() {
                        newMessage = value;
                      })
                    },
                    maxLines: 2,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    decoration: const InputDecoration(
                      label: Text(
                        "message",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: sentMessage,
                    icon: Icon(Icons.arrow_forward),
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
