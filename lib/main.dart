import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iMaz/pages/basicNav.dart';
import 'package:iMaz/pages/constants.dart';
import 'package:iMaz/Widgets/customAppBar.dart';
import 'package:iMaz/pages/home.dart';
import 'package:iMaz/pages/list.dart';
import 'package:iMaz/pages/login.dart';
import 'package:iMaz/pages/rough.dart';
import 'package:iMaz/pages/splash.dart';
import 'package:iMaz/pages/userData.dart';
import 'package:iMaz/pages/wallet.dart';
import 'package:iMaz/routes/routes.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: ((context, orientation, deviceType) {
      return MaterialApp(
        title: appName,
        themeMode: ThemeMode.system,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.teal,
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
        theme: ThemeData(
          primarySwatch: Colors.teal,
          fontFamily: GoogleFonts.raleway().fontFamily,
          // primaryTextTheme: GoogleFonts.ralewayTextTheme(),
        ),
        initialRoute: MyRoutes.splashRoute,
        routes: {
          MyRoutes.loginRoute: (context) => LoginPage(),
          MyRoutes.homeRoute: (context) => HomePage(),
          MyRoutes.roughRoute: (context) => RoughPage(),
          MyRoutes.listRoute: (context) => ListPage(),
          MyRoutes.appRoute: (context) =>
              CustomAppBar(name: "iMaz", place: "Agra", isSubPage: false),
          MyRoutes.walletRoute: (context) => WalletPage(),
          MyRoutes.splashRoute: (context) => SplashPage(),
          MyRoutes.userDataRoute: (context) => UserData(),
          MyRoutes.basicNavRoute: (context) => BasicNav(),

          // MyRoutes.loginRoute: (context) {
          //   return const Text('Hello');
          // },
        },
      );
    }));
  }
}
