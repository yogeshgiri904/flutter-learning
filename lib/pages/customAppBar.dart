import 'package:flutter/material.dart';
import 'package:iMaz/pages/constants.dart';
import 'package:iMaz/pages/rough.dart';
import 'package:iMaz/pages/wallet.dart';
import 'package:iMaz/routes/routes.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final color = secondaryFont;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      color: secondaryColor,
      child: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    const invalidSnackBar = SnackBar(
                        content: Text('Drawer Section is under development'));
                    ScaffoldMessenger.of(context).showSnackBar(invalidSnackBar);
                  },
                  icon: Image.asset(
                    'lib/assets/img/menu.png',
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Yogesh Giri',
                      style: TextStyle(
                        fontFamily: secondaryFont,
                      )),
                  Row(
                    children: [
                      const Icon(
                        Icons.person_pin_circle_sharp,
                        color: defaultColor,
                      ),
                      Text(
                        'Awagarh',
                        style: TextStyle(
                          color: defaultColor,
                          fontFamily: secondaryFont,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              IconButton(
                  onPressed: () {
                    const invalidSnackBar = SnackBar(
                        content: Text('Account Section is under development'));
                    ScaffoldMessenger.of(context).showSnackBar(invalidSnackBar);
                  },
                  icon: Image.asset(
                    'lib/assets/img/profile.png',
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
