import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:iMaz/pages/home.dart';
import 'package:iMaz/pages/login.dart';
import 'package:iMaz/provider/authProvider.dart';
import 'package:iMaz/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:iMaz/pages/constants.dart';

class SplashPage extends StatelessWidget {
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDark = (brightness == Brightness.dark) ? true : false;
    return AnimatedSplashScreen(
      splash: Container(
          child: Column(
        children: [
          Image.asset(
            "lib/assets/img/rocket.gif",
            width: 90.w,
          ),
          Text(
            'iMaz',
            style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
                fontFamily: secondaryFont,
                fontWeight: FontWeight.bold,
                fontSize: 8.w),
          )
        ],
      )),
      splashIconSize: 60.h,
      backgroundColor: isDark ? Colors.black12 : Colors.white,
      nextScreen: authProvider.authToken == '' ? LoginPage() : HomePage(),
    );
  }
}
