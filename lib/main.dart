import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ims/pages/home.dart';
import 'package:ims/pages/login.dart';
import 'package:ims/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: GoogleFonts.raleway().fontFamily,
        // primaryTextTheme: GoogleFonts.ralewayTextTheme(),
      ),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        // MyRoutes.loginRoute: (context) {
        //   return const Text('Hello');
        // },
      },
    );
  }
}
