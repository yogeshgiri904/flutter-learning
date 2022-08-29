import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iMaz/routes/routes.dart';

class RoughPage extends StatefulWidget {
  const RoughPage({Key? key}) : super(key: key);

  @override
  State<RoughPage> createState() => _RoughPageState();
}

class _RoughPageState extends State<RoughPage> {
  int isSelected = 2;
  String devName = 'Yogesh Giri';
  int age = 20;
  String appName = 'iMaz';

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
          child: Column(
        children: [
          Image.asset('lib/assets/img/Me.jpeg'),
          Text(
            "Welcome in $appName",
            style: const TextStyle(
                fontSize: 20,
                height: 3,
                fontWeight: FontWeight.w900,
                color: Colors.blue),
          ),
          const Text(
            "Coming soon...",
            style: TextStyle(fontSize: 14, color: Colors.blue),
          ),
          const SizedBox(
            height: 15,
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
