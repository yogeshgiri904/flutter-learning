import 'package:flutter/material.dart';
import 'package:iMaz/Widgets/customCardView.dart';
import 'package:iMaz/pages/constants.dart';
import 'package:iMaz/Widgets/customAppBar.dart';
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
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDark = (brightness == Brightness.dark) ? 1 : 0;
    return Container(
        child: Column(
      children: [
        CustomAppBar(name: 'iMaz', place: 'Agra', isSubPage: false),
        Container(
          child: Center(
              child: Row(
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
          )),
        )
      ],
    ));
  }
}
