import 'package:chat_demo/enums.dart';

class Contact {
  int id;
  String name;
  String avatar;
  List<String> messages;

  Contact(
      {required this.id,
      required this.name,
      required this.avatar,
      this.messages = const []});
}

List<Contact> contacts = [
  Contact(id: 1, name: "Napoleon", avatar: "napoleon.jpg"),
  Contact(id: 2, name: "Some Crazy Guy", avatar: "crazy_guy.jpg"),
  Contact(id: 3, name: "Злой курица", avatar: "angry_cock.jpeg"),
  Contact(id: 4, name: "AI телка", avatar: "ai_girl.jpeg"),
  Contact(id: 5, name: "Donald Trump", avatar: "trump.jpeg"),
  Contact(id: 6, name: "Billy Herrington", avatar: "billy.jpeg"),
  Contact(id: 7, name: "Tony Robbins", avatar: "robbins.jpeg"),
  Contact(id: 8, name: "Harold", avatar: "harold.jpeg"),
  Contact(id: 9, name: "Homer", avatar: "homer.jpg"),
  Contact(id: 10, name: "Hubert Farnsworth", avatar: "hubert.jpeg")
];


class Message{
  MessageDirection direction;
  String text;
  
  Message({required this.direction, required this.text});
}


List<Message> messages = [
  Message(direction: MessageDirection.fromContact, text: "Привет"),
  Message(direction: MessageDirection.fromContact, text: "Как дела?"),
  Message(direction: MessageDirection.toContact, text: "привет. \n норм. Го по пивасу"),
  Message(direction: MessageDirection.fromContact, text: "Я щас не могу. Занят"),
  Message(direction: MessageDirection.toContact, text: "Чем ты там занят?)"),
  Message(direction: MessageDirection.fromContact, text: "Чем надо, тем и занят)"),
  Message(direction: MessageDirection.toContact, text: "Ты бездельник, пошли на вторую Дюну)"),
  Message(direction: MessageDirection.fromContact, text: "не, не хочу"),
  Message(direction: MessageDirection.toContact, text: "че ты вечно сидишь и никуда не ходишь"),
  Message(direction: MessageDirection.toContact, text: "скучный писец"),
  Message(direction: MessageDirection.fromContact, text: "Я планирую"),
  Message(direction: MessageDirection.toContact, text: "Что?"),
  Message(direction: MessageDirection.fromContact, text: "Захват мира"),
];