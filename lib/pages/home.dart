import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iMaz/pages/dashboard.dart';
import 'package:iMaz/pages/list.dart';
import 'package:iMaz/pages/constants.dart';
import 'package:iMaz/pages/report.dart';
import 'package:iMaz/pages/userProfile.dart';
import 'package:iMaz/pages/wallet.dart';
import 'package:iMaz/provider/authProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
    UserProfile(),
  ];
  @override
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    authProvider.getUsersData();

    final brightness = MediaQuery.of(context).platformBrightness;
    final isDark = (brightness == Brightness.dark) ? 1 : 0;

    var scaffold = Scaffold(
      backgroundColor: primaryShadowColor,
      body: pageList[navIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: navIndex,
        backgroundColor: Colors.transparent,
        color: isDark == 1 ? pureBlack : pureWhite,
        items: [
          Icon(
            Icons.upload_file_outlined,
            size: 30,
            color: navIndex == 0 ? primaryColor : Colors.grey,
          ),
          Icon(
            Icons.my_library_books_outlined,
            size: 30,
            color: navIndex == 1 ? primaryColor : Colors.grey,
          ),
          Icon(
            navIndex == 2
                ? Icons.space_dashboard_rounded
                : Icons.dashboard_outlined,
            size: navIndex == 2 ? 42 : 30,
            color: navIndex == 2 ? primaryColor : Colors.grey,
          ),
          Icon(
            Icons.account_balance_wallet_outlined,
            size: 30,
            color: navIndex == 3 ? primaryColor : Colors.grey,
          ),
          Icon(
            Icons.account_circle_outlined,
            size: 30,
            color: navIndex == 4 ? primaryColor : Colors.grey,
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
