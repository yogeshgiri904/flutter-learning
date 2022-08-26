import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int age = 20;
    var appName = 'iMaz';
    String name = 'Yogesh Giri';
    int maxAge = add(a: age);
    // var imagePath = 'assets/img/Me.jpeg';

    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text(appName),
      ),
      body: Center(
          child: Column(
        children: [
          Image.asset('assets/img/Me.jpeg'),
          Text(
            "Welcome in $appName",
            style: const TextStyle(
                fontSize: 25,
                height: 5,
                fontWeight: FontWeight.w900,
                color: Colors.blue),
          )
        ],
      )),
      drawer: Drawer(
          child: Center(
              child: Text.rich(
        TextSpan(
          text: 'Welcome !\n',
          style: const TextStyle(height: 5),
          children: <TextSpan>[
            TextSpan(
              text: 'Name: $name \n',
              style: const TextStyle(
                  fontSize: 25,
                  height: 0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange),
            ),
            TextSpan(
              text: 'Age: $maxAge\n',
              style: const TextStyle(
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
