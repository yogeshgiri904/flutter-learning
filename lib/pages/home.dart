import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iMaz/Widgets/customAppBar.dart';
import 'package:iMaz/pages/dashboard.dart';
import 'package:iMaz/pages/list.dart';
import 'package:iMaz/pages/constants.dart';
import 'package:iMaz/pages/report.dart';
import 'package:iMaz/pages/rough.dart';
import 'package:iMaz/pages/wallet.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int navIndex = 2;

  var pageList = [
    ListPage(),
    Report(),
    DashboardPage(),
    WalletPage(),
    RoughPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDark = (brightness == Brightness.dark) ? 1 : 0;
    var scaffold = Scaffold(
      backgroundColor: pureWhite,
      body: pageList[navIndex],
      // floatingActionButton: Container(
      //   decoration: BoxDecoration(
      //       shape: BoxShape.circle,
      //       color: primaryColor,
      //       boxShadow: [
      //         BoxShadow(WW
      //             color: Colors.grey.shade500, spreadRadius: .2, blurRadius: 5)
      //       ]),
      //   child: IconButton(
      //     onPressed: () {
      //       Navigator.pushNamed(context, MyRoutes.loginRoute);
      //     },
      //     icon: const Icon(Icons.logout),
      //     color: pureWhite,
      //   ),
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        index: navIndex,
        backgroundColor: Colors.transparent,
        color: isDark == 1 ? pureBlack : primaryColor,
        items: const [
          Icon(
            Icons.upload_file_outlined,
            size: 30,
            color: pureWhite,
          ),
          Icon(
            Icons.my_library_books_outlined,
            size: 30,
            color: pureWhite,
          ),
          Icon(
            Icons.dashboard_outlined,
            size: 30,
            color: pureWhite,
          ),
          Icon(
            Icons.account_balance_wallet,
            size: 30,
            color: pureWhite,
          ),
          Icon(
            Icons.account_circle_outlined,
            size: 30,
            color: pureWhite,
          ),
        ],
        onTap: (index) {
          setState(() {
            navIndex = index;
          });
          // Handle button tap
        },
      ),
    );
    return scaffold;
  }
}
