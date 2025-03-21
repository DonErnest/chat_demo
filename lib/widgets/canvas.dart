import 'package:flutter/material.dart';

class MessengerCanvas extends StatelessWidget {
  final Widget widget;
  const MessengerCanvas({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromRGBO(27,27,27, 1),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: widget
        ),
      ),
    );
  }
}
