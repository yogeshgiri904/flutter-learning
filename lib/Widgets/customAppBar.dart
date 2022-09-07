import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iMaz/pages/constants.dart';
import 'package:iMaz/pages/dashboard.dart';
import 'package:iMaz/pages/rough.dart';
import 'package:iMaz/pages/wallet.dart';
import 'package:iMaz/routes/routes.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget {
  String name;
  String place;
  bool isSubPage;
  CustomAppBar(
      {required this.name, required this.place, required this.isSubPage});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.w,
        color: secondaryColor,
        child: Column(
          children: [
            SizedBox(
              height: 3.5.h,
            ),
            Container(
              height: 8.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      isSubPage
                          ? BackButton()
                          : IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'lib/assets/img/menu.png',
                                width: 6.w,
                              )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(name,
                              style: TextStyle(
                                  fontFamily: secondaryFont, fontSize: 3.8.w)),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/list',
                              );
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.person_pin_circle_sharp,
                                  color: defaultColor,
                                ),
                                Text(
                                  place,
                                  style: TextStyle(
                                      color: defaultColor,
                                      fontFamily: secondaryFont,
                                      fontSize: 3.8.w),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'lib/assets/img/profile.png',
                            width: 10.w,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
