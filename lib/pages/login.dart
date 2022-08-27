import 'package:flutter/material.dart';
import 'package:ims/routes/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String devName = 'Yogesh Giri';

    var scaffold = Scaffold(
        body: Container(
      color: Colors.white,
      child: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Image.asset(
                'lib/assets/img/logo.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              // padding: const EdgeInsets.all(15.0),
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
              child: Column(
                children: [
                  Container(
                    color: Colors.grey[100],
                    padding: const EdgeInsets.symmetric(
                        vertical: 3.0, horizontal: 10.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_circle_outlined),
                        hintText: 'yogesh.giri@imaz.com', // placeholder
                        labelText: 'Username', // label
                        enabledBorder: InputBorder.none,
                        // errorText: 'errorText', // error
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.grey[100],
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 00.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 3.0, horizontal: 10.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock_outline_sharp),
                        hintText: 'xxxxxxxx', // placeholder
                        labelText: 'Password', // label
                        enabledBorder: InputBorder.none,
                        // errorText: 'errorText', // error
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.teal,
                        minimumSize: const Size(280, 45)),
                    child: const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Created by $devName ❤️',
              style: const TextStyle(
                height: 8,
              ),
            ),
          ],
        ),
      )),
    ));
    return scaffold;
  }
}
