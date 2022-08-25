import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaffold = const Scaffold(
      body: Center(child: Text("Welcome To Login")),
    );
    return scaffold;
  }
}
