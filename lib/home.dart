import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int age = 20;
    var appName = 'iMaz';
    String name = 'Yogesh Giri';
    int maxAge = add(a: age);

    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text(appName),
      ),
      body: Center(child: Text("Welcome in $appName")),
      drawer: const Drawer(
          child: Center(
              child: Text.rich(
        TextSpan(
          text: 'Welcome !\n',
          style: TextStyle(height: 5),
          children: <TextSpan>[
            TextSpan(
              text: 'Name: Yogesh Giri\n',
              style: TextStyle(
                  fontSize: 25,
                  height: 0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            TextSpan(
              text: 'Age: 22\n',
              style: TextStyle(
                  fontSize: 25,
                  height: 0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange),
            ),
          ],
        ),
      ))),
    );
    return scaffold;
  }

  add({required int a, int b = 2}) {
    return a + b;
  }
}
