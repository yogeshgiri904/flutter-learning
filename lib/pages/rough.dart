import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iMaz/routes/routes.dart';

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
      body: Center(
          child: Column(
        children: [
          Image.asset('lib/assets/img/Me.jpeg'),
          Text(
            "Welcome in $appName",
            style: const TextStyle(
                fontSize: 25,
                height: 2,
                fontWeight: FontWeight.w900,
                color: Colors.blue),
          ),
          const Text(
            "Coming soon...",
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                minimumSize: const Size(200, 45)),
            child: const Text(
              "Sign Out",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.loginRoute);
            },
          )
        ],
      )),
    );
    return scaffold;
  }

  add({required int a, int b = 2}) {
    return a + b;
  }
}
