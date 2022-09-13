import 'package:flutter/material.dart';
import 'package:iMaz/pages/constants.dart';
import 'package:sizer/sizer.dart';

class StatsCard extends StatelessWidget {
  double height;
  double weight;
  Widget image;
  Widget icon;
  Widget text;
  Widget text2;

  Widget button;
  Color color;

  StatsCard({
    required this.height,
    required this.weight,
    this.image = const SizedBox.shrink(),
    this.icon = const SizedBox.shrink(),
    this.text = const SizedBox.shrink(),
    this.text2 = const SizedBox.shrink(),
    this.button = const SizedBox.shrink(),
    this.color = Colors.white,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      width: weight,
      height: height,
      child: Padding(
        padding: EdgeInsets.all(weight / 20),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                image,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [text, text2],
                )
              ]),
        ),
      ),
    );
  }
}
