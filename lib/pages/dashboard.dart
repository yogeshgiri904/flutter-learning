import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iMaz/pages/login.dart';
import 'package:iMaz/pages/rough.dart';
import 'package:iMaz/routes/routes.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int isSelected = 1;
  String devName = 'Yogesh Giri';
  int age = 20;
  String appName = 'iMaz';

  add({required int a, int b = 2}) {
    return a + b;
  }

  @override
  Widget build(BuildContext context) {
    int maxAge = add(a: age);
    var secondaryFont = GoogleFonts.poppins().fontFamily;

    var scaffold = Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 100.w,
                height: 8.h,
                // color: Colors.deepOrange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'lib/assets/img/menu.png',
                          width: 25,
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
                              color: Colors.deepPurple,
                            ),
                            Text(
                              'Awagarh',
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontFamily: secondaryFont,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Image.asset(
                      'lib/assets/img/profile.png',
                      width: 40,
                    )
                  ],
                ),
              ),
              // Container(),
              Card(
                elevation: 5,
                child: Container(
                    width: 92.5.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'lib/assets/img/heart1.png',
                          width: 35.w,
                        ),
                        const Text(
                          'Hello, Yogesh Giri',
                          // style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ))),
              ),
              Card(
                elevation: 5,
                child: Container(
                    width: 92.5.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'lib/assets/img/reward.png',
                                width: 20.w,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Overall Rank',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: secondaryFont),
                              ),
                              SizedBox(height: .5.h),
                              const Text(
                                'Congratulations! You got 2nd rank',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  height: 1.2,
                                  fontSize: 12,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              const Text(
                                'in our class.',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '86 %',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: secondaryFont),
                                    ),
                                    LinearPercentIndicator(
                                      width: 20.h,
                                      lineHeight: 14.0,
                                      percent: 0.86,
                                      backgroundColor: Colors.grey,
                                      progressColor: Colors.purple,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 5,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        width: 45.w,
                        height: 20.h,
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'lib/assets/img/discussion.png',
                                  width: 15.w,
                                ),
                                Text(
                                  'Exams',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: secondaryFont),
                                ),
                                const Text(
                                  'Find your exam',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ]),
                        )),
                  ),
                  Card(
                    elevation: 5,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        width: 45.w,
                        height: 20.h,
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'lib/assets/img/working-hours.png',
                                  width: 15.w,
                                ),
                                Text(
                                  'Lectures',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: secondaryFont),
                                ),
                                const Text(
                                  'Find your lectures',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ]),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: .1.h,
              )
            ],
          ),
        ),
      ),
    );
    return scaffold;
  }
}
