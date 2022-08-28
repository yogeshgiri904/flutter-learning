import 'package:flutter/material.dart';
import 'package:iMaz/routes/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    String devName = 'Yogesh Giri';
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDark = (brightness == Brightness.dark) ? 1 : 0;
    var scaffold = Scaffold(
        body: Center(
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
                  color: isDark == 1 ? Colors.grey[800] : Colors.grey[200],
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 10.0),
                  child: TextFormField(
                    controller: usernameController,
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
                  color: isDark == 1 ? Colors.grey[800] : Colors.grey[200],
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 00.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 10.0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
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
                      backgroundColor: Colors.purple,
                      minimumSize: const Size(280, 45)),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    // if (passwordController.text == '' ||
                    //     usernameController.text == '') {
                    //   const emptySnackBar = SnackBar(
                    //       content:
                    //           Text('Username or Password cannot be Empty'));
                    //   ScaffoldMessenger.of(context).showSnackBar(emptySnackBar);
                    // } else
                    if (passwordController.text == '111') {
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    } else {
                      const invalidSnackBar =
                          SnackBar(content: Text('Invalid Credentials'));
                      ScaffoldMessenger.of(context)
                          .showSnackBar(invalidSnackBar);
                    }
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
    )));
    return scaffold;
  }
}
