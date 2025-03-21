import 'package:flutter/material.dart';

class MessageRow extends StatelessWidget {
  final String text;
  final String author;
  final String sent;
  final bool byAuthor;

  const MessageRow({super.key, required this.text, this.byAuthor = false, required this.author, required this.sent});

  @override
  Widget build(BuildContext context) {
    var padding = byAuthor
        ? const EdgeInsets.fromLTRB(100, 10, 5, 10)
        : const EdgeInsets.fromLTRB(5, 10, 100, 10);
    var axisAlignment =
        byAuthor ? MainAxisAlignment.end : MainAxisAlignment.start;
    var messageColor = byAuthor
        ? const Color.fromRGBO(128, 128, 128, 1)
        : const Color.fromRGBO(255, 163, 26, 1);
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: axisAlignment,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: messageColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    author,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const Divider(),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Received on ${sent}",
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
