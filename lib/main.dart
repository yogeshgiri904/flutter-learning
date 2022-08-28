import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iMaz/pages/home.dart';
import 'package:iMaz/pages/login.dart';
import 'package:iMaz/routes/routes.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: ((context, orientation, deviceType) {
      return MaterialApp(
        title: 'iMaz',
        themeMode: ThemeMode.system,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.purple,
          fontFamily: GoogleFonts.raleway().fontFamily,
          // primaryColor: Colors.white,
        ),
        theme: ThemeData(
          primarySwatch: Colors.purple,
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
    }));
  }
}
