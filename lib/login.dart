import 'package:flutter/material.dart';
import 'package:ims/home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
        body: Center(
            child: Column(
      children: [
        Image.asset('assets/img/image1.png'),
        const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'yogesh.giri@imaz.com', // placeholder
                  labelText: 'Username', // label
                  // errorText: 'errorText', // error
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'xxxxxxxx', // placeholder
                  labelText: 'Password', // label
                  // errorText: 'errorText', // error
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        RaisedButton(
          child: const Text(
            'Login',
            style: TextStyle(fontSize: 22.0, color: Colors.purple),
          ),
          onPressed: () {
            navigateToPage(context);
          },
        ) // <-- SEE HERE
      ],
    )));
    return scaffold;
  }

  void navigateToPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
