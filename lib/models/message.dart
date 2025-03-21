import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Message {
  late String id;
  String message;
  String author;
  DateTime datetime;

  Message(
      {String? id,
      required this.message,
      required this.author,
      required this.datetime})
      : id = id ?? uuid.v4();
}

List<Message> messages = [
  Message(author: "Unabomber", message: "Привет", datetime: DateTime.now().subtract(Duration(minutes: 10))),
  Message(author: "Unabomber", message: "Как дела?", datetime: DateTime.now().subtract(Duration(minutes: 9))),
  Message(author: "Belmek", message: "привет. \n норм. Го по пивасу", datetime: DateTime.now().subtract(Duration(minutes: 8))),
  Message(author: "Unabomber", message: "Я щас не могу. Занят", datetime: DateTime.now().subtract(Duration(minutes: 7))),
  Message(author: "Belmek", message: "Чем ты там занят?)", datetime: DateTime.now().subtract(Duration(minutes: 6))),
  Message(author: "Unabomber", message: "Чем надо, тем и занят)", datetime: DateTime.now().subtract(Duration(minutes: 5))),
  Message(author: "Belmek", message: "Ты бездельник, пошли на вторую Дюну)", datetime: DateTime.now().subtract(Duration(minutes: 4))),
  Message(author: "Unabomber", message: "не, не хочу", datetime: DateTime.now().subtract(Duration(minutes: 3))),
  Message(author: "Belmek", message: "че ты вечно сидишь и никуда не ходишь", datetime: DateTime.now().subtract(Duration(minutes: 2))),
  Message(author: "Belmek", message: "скучный писец", datetime: DateTime.now().subtract(Duration(minutes: 1))),
  Message(author: "Unabomber", message: "Я планирую", datetime: DateTime.now().subtract(Duration(seconds: 50))),
  Message(author: "Belmek", message: "Что?", datetime: DateTime.now().subtract(Duration(seconds: 40))),
  Message(author: "Unabomber", message: "Захват мира", datetime: DateTime.now().subtract(Duration(seconds: 30))),
];
