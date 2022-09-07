import 'package:flutter/material.dart';
import 'package:iMaz/Widgets/customAppBar.dart';
import 'package:iMaz/Widgets/customCardView.dart';
import 'package:iMaz/pages/list.dart';
import 'package:iMaz/routes/routes.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BasicNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    var title = args['data']['title'];
    var day = args['data']['day'];

    var scaffold = Scaffold(
      body: Container(
        height: 100.h,
        child: Column(
          children: [
            CustomAppBar(
              name: title,
              place: day,
              isSubPage: true,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text("Welcome to ${title}"),
            Text("${day}"),
            SizedBox(
              height: 3.h,
            ),
            CircularProgressIndicator(),
            // CircularPercentIndicator(
            //   radius: 15.w,
            //   animation: true,
            //   animationDuration: 600,
            //   percent: .78,
            // )
          ],
        ),
      ),
    );
    return scaffold;
  }
}
