import 'package:chat_demo/widgets/canvas.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final void Function(String login) onLoginEntered;

  const LoginScreen({super.key, required this.onLoginEntered});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? _loginController;
  String? _newLogin;

  @override
  void initState() {
    _loginController = TextEditingController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MessengerCanvas(
      widget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Enter your chat username",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const Divider(
              color: Color.fromRGBO(255, 163, 26, 1),
            ),
            TextField(
              controller: _loginController,
              onChanged: (value) => setState(() => _newLogin = value),
              maxLines: 1,
              maxLength: 30,
              style: TextStyle(color: Colors.black, fontSize: 20),
              decoration: const InputDecoration(
                label: Text(
                  "login",
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
            IconButton(
              onPressed: () => {
                if (_newLogin != null) {
                  widget.onLoginEntered(_newLogin!)
                }
              },
              icon: Icon(Icons.arrow_forward),
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(
                    Color.fromRGBO(255, 163, 26, 1)),
                foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
