import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iMaz/Widgets/customCardView.dart';
import 'package:iMaz/models/userList.dart';
import 'package:iMaz/pages/constants.dart';
import 'package:iMaz/Widgets/customAppBar.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:fl_chart/fl_chart.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);
  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  List? _userListData;
  Future getData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    final List userListData = userListFromJson(response.body);

    // print(userList[0].title);

    setState(() {
      _userListData = userListData;
    });
  }

  // Future getUserData() async {
  //   var url = Uri.parse('http://13.126.90.63/users/me/');
  //   var response = await http.get(url, headers: {
  //     'Authorization':
  //         'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk0MzY2NjkzLCJpYXQiOjE2NjI4MzA2OTMsImp0aSI6IjRkMGYxYzFkNWI3MDQwYjQ5Yzc4NjM5NzYxNTc5MTUyIiwidXNlcl9pZCI6NH0.GTT3Om09wHoVd1A4dCD93jwYGktbT3chrCvZw-TjItg',
  //   });
  //   userList = jsonDecode(response.body);
  //   // print(userList[0]['first_name']);
  //   return userList;
  // }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDark = (brightness == Brightness.dark) ? 1 : 0;
    return Container(
        child: Column(
      children: [
        CustomAppBar(name: 'iMaz', place: 'Agra', isSubPage: false),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomCardView(
              height: 25.h,
              weight: 46.w,
              icon: CircularPercentIndicator(
                radius: 12.w,
                percent: .58,
                animation: true,
                animationDuration: 700,
                lineWidth: 2.w,
                center: Text(
                  '58 %',
                  style: TextStyle(fontFamily: secondaryFont),
                ),
                circularStrokeCap: CircularStrokeCap.round,
              ),
              primaryText: 'Course Completed',
              secondaryText: '( 2022 )',
            ),
            CustomCardView(
              height: 25.h,
              weight: 46.w,
              icon: CircularPercentIndicator(
                radius: 12.w,
                percent: .58,
                animation: true,
                animationDuration: 700,
                lineWidth: 2.w,
                progressColor: Colors.purple,
                center: Text(
                  '72 %',
                  style: TextStyle(fontFamily: secondaryFont),
                ),
                circularStrokeCap: CircularStrokeCap.round,
              ),
              primaryText: 'Seats Filled',
              secondaryText: '( 2022 )',
            ),
          ],
        ),
        Container(
            child: _userListData == null
                ? CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Image.asset(
                              'lib/assets/img/3d.png',
                            ),
                            title: Text(_userListData![index].title),
                            subtitle: Text(_userListData![index].body),
                          ),
                        ),
                      );
                    },
                    itemCount: _userListData!.length,
                  )))
      ],
    ));
  }
}
