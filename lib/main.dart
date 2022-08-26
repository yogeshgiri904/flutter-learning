import 'package:flutter/material.dart';
import 'package:ims/home.dart';
import 'package:ims/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginPage(),
        "/login": (context) => const HomePage(),
        "/hello": (context) {
          return const Text('Hello');
        },
      },
    );
  }
}
