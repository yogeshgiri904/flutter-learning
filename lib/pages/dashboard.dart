import 'package:flutter/material.dart';
import 'package:iMaz/Widgets/CustomCard.dart';
import 'package:iMaz/Widgets/StatsCard.dart';
import 'package:iMaz/pages/constants.dart';
import 'package:iMaz/Widgets/customAppBar.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:action_slider/action_slider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class Stats {
  String percentage;
  String name;
  Color color;
  String image;

  Stats(
      {required this.percentage,
      required this.name,
      this.color = primaryColor,
      required this.image});
}

class _DashboardPageState extends State<DashboardPage> {
  String dateTime = '12 Aug 2022';
  bool notificationStatus = true;

  List stats = [
    Stats(
        percentage: '34K',
        name: 'Students',
        color: Colors.blue,
        image: 'lib/assets/img/love.png'),
    Stats(
        percentage: '3K',
        name: 'Teachers',
        color: Colors.red,
        image: 'lib/assets/img/goal.png'),
    Stats(
        percentage: '38',
        name: 'Admin',
        color: Colors.teal,
        image: 'lib/assets/img/medal.png'),
    Stats(percentage: '234M', name: 'Fees', image: 'lib/assets/img/reward.png')
  ];

  setDate<String>() {
    setState(() {
      final now = DateTime.now();
      dateTime = DateFormat.yMMMMd('en_US').format(now);
    });
    return dateTime;
  }

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    bool isDark = (brightness == Brightness.dark) ? true : false;
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: primaryColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hii, $devName',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: secondaryFont,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                          fontSize: 3.w,
                          color: Colors.grey,
                          fontFamily: secondaryFont),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (notificationStatus == false) {
                          notificationStatus = true;
                        } else {
                          notificationStatus = false;
                        }
                      });
                    },
                    icon: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Icon(
                        notificationStatus
                            ? Icons.notifications_rounded
                            : Icons.notifications_off_rounded,
                      ),
                    ))
              ],
            ),
          ),
        ),
        Container(
          width: 100.w,
          height: 10.h,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
        Stack(
          children: [
            Center(
              child: Transform.translate(
                offset: Offset(0.0, -4.h),
                child: Container(
                  height: 7.2.h,
                  width: 90.w,
                  child: Card(
                    elevation: 3,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'What you want ?',
                          hintStyle:
                              TextStyle(color: primaryColor, fontSize: 4.w),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.search_rounded),
                            color: primaryColor,
                          ),
                          enabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14, left: 20),
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Container(
            width: 100.w,
            height: 50.h,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.home_max_rounded),
                          label: Text(
                            'Discover',
                            style: TextStyle(
                                fontSize: 3.2.w,
                                fontWeight: FontWeight.bold,
                                fontFamily: secondaryFont),
                          ),
                        ),
                        Text(setDate(),
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 3.2.w,
                                fontFamily: secondaryFont)),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomCard(
                        height: 20.h,
                        weight: 42.w,
                        color: Color.fromARGB(255, 254, 228, 211),
                        icon: Icon(
                          Icons.currency_rupee_rounded,
                          color: Color.fromARGB(255, 220, 129, 69),
                          size: 11.w,
                        ),
                        text: Text(
                          'Fee',
                          style: TextStyle(
                              color: Color.fromARGB(255, 220, 129, 69),
                              fontFamily: secondaryFont),
                        ),
                      ),
                      CustomCard(
                        height: 20.h,
                        weight: 42.w,
                        color: Color.fromARGB(255, 198, 238, 246),
                        icon: Icon(
                          Icons.verified_user_rounded,
                          color: Color.fromARGB(255, 61, 179, 202),
                          size: 11.w,
                        ),
                        text: Text(
                          'Safety',
                          style: TextStyle(
                              color: Color.fromARGB(255, 61, 179, 202),
                              fontFamily: secondaryFont),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomCard(
                        height: 20.h,
                        weight: 42.w,
                        color: Color.fromARGB(255, 244, 218, 243),
                        icon: Icon(
                          Icons.favorite_rounded,
                          color: Color.fromARGB(255, 205, 76, 201),
                          size: 11.w,
                        ),
                        text: Text(
                          'Subjects',
                          style: TextStyle(
                              color: Color.fromARGB(255, 205, 76, 201),
                              fontFamily: secondaryFont),
                        ),
                      ),
                      CustomCard(
                        height: 20.h,
                        weight: 42.w,
                        color: Color.fromARGB(184, 204, 250, 125),
                        icon: Icon(
                          Icons.music_note_rounded,
                          color: Color.fromARGB(184, 104, 157, 12),
                          size: 11.w,
                        ),
                        text: Text(
                          'Lectures',
                          style: TextStyle(
                              color: Color.fromARGB(184, 104, 157, 12),
                              fontFamily: secondaryFont),
                        ),
                      ),
                    ],
                  )
                ]),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.query_stats_rounded),
                      label: Text(
                        'Monthly Stats',
                        style: TextStyle(
                            fontSize: 3.2.w,
                            fontWeight: FontWeight.bold,
                            fontFamily: secondaryFont),
                      ),
                    ),
                    Text('Know More >>',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 3.2.w,
                            fontFamily: secondaryFont)),
                  ],
                ),
              ),
              Container(
                  width: 100.w,
                  height: 120,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Card(
                              elevation: 4,
                              child: Padding(
                                padding: EdgeInsets.all(1.w),
                                child: StatsCard(
                                  height: 85,
                                  weight: 85,
                                  image: Image.asset(
                                    stats[index].image,
                                    width: 30,
                                  ),
                                  text: Text(
                                    // '${double.parse((stats[index].percentage * 100).toStringAsFixed(2))} %',
                                    stats[index].percentage,
                                    style: TextStyle(
                                        fontSize: 3.5.w,
                                        fontFamily: secondaryFont,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  text2: Text(
                                    stats[index].name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: secondaryFont,
                                        fontSize: 2.5.w,
                                        color: Colors.blueGrey),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: stats.length,
                    ),
                  )),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.event_note_rounded),
                      label: Text(
                        'Upcoming Events',
                        style: TextStyle(
                            fontSize: 3.2.w,
                            fontWeight: FontWeight.bold,
                            fontFamily: secondaryFont),
                      ),
                    ),
                    Text('Know More >>',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 3.2.w,
                            fontFamily: secondaryFont)),
                  ],
                ),
              ),
              // Container(
              //     width: 100.w,
              //     height: 30.h,
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 5.w),
              //       child: ListView.builder(
              //         itemBuilder: (context, index) {
              //           return Padding(
              //             padding: const EdgeInsets.all(5.0),
              //             child: ListTile(
              //               tileColor: pureWhite,
              //               leading: Container(
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(10),
              //                   color: Colors.black26,
              //                 ),
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Image.asset(
              //                       'lib/assets/img/discussion.png'),
              //                 ),
              //               ),
              //               title: Text('data'),
              //               subtitle: Text('data'),
              //               trailing: Text('data'),
              //             ),
              //           );
              //         },
              //         itemCount: 2,
              //       ),
              //     )),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        )
      ],
    ));
  }
}
