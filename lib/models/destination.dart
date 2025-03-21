import 'package:chat_demo/enums.dart';
import 'package:flutter/cupertino.dart';

class Destination {
  final Screen screen;
  final Widget appBarTitle;
  final Widget body;

  final List<Widget> appBarActions;

  const Destination(
      {required this.screen,
      required this.appBarTitle,
      required this.body,
      required this.appBarActions});
}
