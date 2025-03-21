import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Message {
  late String id;
  String message;
  String author;
  DateTime datetime;

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json["_id"],
      message: json["message"],
      author: json["author"],
      datetime: DateTime.parse(json["datetime"]),
    );
  }

  Message(
      {String? id,
      required this.message,
      required this.author,
      required this.datetime})
      : id = id ?? uuid.v4();
}
