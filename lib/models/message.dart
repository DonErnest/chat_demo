import 'package:chat_demo/util.dart';
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
      datetime: DateTime.parse(json["datetime"]).toLocal(),
    );
  }

  Message(
      {String? id,
      required this.message,
      required this.author,
      required this.datetime})
      : id = id ?? uuid.v4();

  String get sentDisplay =>
      "${zeroPad(this.datetime.hour)}:${zeroPad(this.datetime.minute)} ${zeroPad(this.datetime.day)}.${zeroPad(this.datetime.month)}.${this.datetime.year.toString().substring(2)}";
}
