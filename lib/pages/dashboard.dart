import 'package:flutter/material.dart';
import 'package:iMaz/pages/constants.dart';
import 'package:iMaz/pages/customAppBar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final color = secondaryFont;

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDark = (brightness == Brightness.dark) ? 1 : 0;
    return SingleChildScrollView(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        CustomAppBar(),
        Container(
          color: secondaryColor,
          width: 100.w,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hii, Yogesh Giri',
                              style: TextStyle(
                                fontFamily: secondaryFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 5.w,
                              ),
                            ),
                            const Text('Good morning !'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: .5.h,
                    ),
                    Positioned(
                      child: Column(
                        children: [
                          Card(
                            elevation: 3,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(1.w),
                              child: const TextField(
                                decoration: InputDecoration(
                                    hintText: 'Search',
                                    suffixIcon: Icon(Icons.search_sharp),
                                    enabledBorder: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.only(top: 15, left: 20),
                                    focusedBorder: InputBorder.none),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 60.h,
          child: ListView(
            children: [
              Card(
                elevation: 3,
                borderOnForeground: false,
                child: Container(
                    width: 92.5.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: isDark == 1 ? pureBlack : pureWhite,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.qr_code_2,
                          size: 40.w,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const Text(
                          'UPI ID - yogeshgiri904',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            color: defaultColor,
                          ),
                        ),
                        const Text(
                          'ICICI Bank',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ))),
              ),
              Card(
                elevation: 3,
                child: Container(
                    width: 92.5.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                        color: isDark == 1 ? pureBlack : pureWhite,
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
                                      '66 %',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: secondaryFont),
                                    ),
                                    LinearPercentIndicator(
                                      width: 20.h,
                                      lineHeight: 14.0,
                                      percent: 0.66,
                                      backgroundColor:
                                          Color.fromARGB(255, 189, 187, 187),
                                      progressColor: Colors.blueGrey,
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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 3,
                        child: Container(
                            decoration: BoxDecoration(
                                color: isDark == 1 ? pureBlack : pureWhite,
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
                        elevation: 3,
                        child: Container(
                            decoration: BoxDecoration(
                                color: isDark == 1 ? pureBlack : pureWhite,
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
                ],
              ),
              SizedBox(
                height: .1.h,
              )
            ],
          ),
        )
      ]),
    );
  }
}
