import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iMaz/pages/dashboard.dart';
import 'package:iMaz/pages/login.dart';
import 'package:iMaz/pages/rough.dart';
import 'package:iMaz/routes/routes.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int isSelected = 1;
  String devName = 'Yogesh Giri';
  int age = 20;
  String appName = 'iMaz';
  int navIndex = 0;
  var pageList = [DashboardPage(), LoginPage(), RoughPage(), DashboardPage()];
  var pageColor = [
    Color.fromARGB(255, 232, 170, 243),
    Colors.white,
    Colors.greenAccent,
    Colors.lightBlueAccent,
  ];

  add({required int a, int b = 2}) {
    return a + b;
  }

  @override
  Widget build(BuildContext context) {
    int maxAge = add(a: age);
    var secondaryFont = GoogleFonts.poppins().fontFamily;

    var scaffold = Scaffold(
      backgroundColor: pageColor[navIndex],
      body: pageList[navIndex],
      floatingActionButton: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.purple,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade500, spreadRadius: .2, blurRadius: 5)
            ]),
        child: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.loginRoute);
          },
          icon: const Icon(Icons.logout),
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: navIndex,
        backgroundColor: Colors.transparent,
        items: const [
          Icon(Icons.dashboard_outlined, size: 30),
          Icon(Icons.my_library_books_outlined, size: 30),
          Icon(Icons.currency_rupee_outlined, size: 30),
          Icon(Icons.account_circle_outlined, size: 30),
        ],
        onTap: (index) {
          setState(() {
            navIndex = index;
          });
          //Handle button tap
        },
      ),
    );
    return scaffold;
  }
}
