import 'package:flutter/material.dart';
import 'package:iMaz/pages/constants.dart';
import 'package:sizer/sizer.dart';

class CustomCard extends StatelessWidget {
  double height;
  double weight;
  Widget image;
  Widget icon;
  Widget text;

  Widget button;
  Color color;

  CustomCard({
    required this.height,
    required this.weight,
    this.image = const SizedBox.shrink(),
    this.icon = const SizedBox.shrink(),
    this.text = const SizedBox.shrink(),
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
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          image,
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromARGB(178, 255, 255, 255),
              ),
              child: Padding(padding: EdgeInsets.all(3.w), child: icon)),
          SizedBox(
            height: height / 20,
          ),
          text,
          button
        ]),
      ),
    );
  }
}
