import 'package:flutter/material.dart';
import 'package:iMaz/pages/constants.dart';

class CustomCardView extends StatelessWidget {
  double height;
  double weight;
  Widget image;
  Widget icon;
  String primaryText;
  String secondaryText;
  Widget button;

  CustomCardView(
      {required this.height,
      required this.weight,
      this.image = const SizedBox.shrink(),
      this.icon = const SizedBox.shrink(),
      this.primaryText = '',
      this.secondaryText = '',
      this.button = const SizedBox.shrink()});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          width: weight,
          height: height,
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              image,
              icon,
              SizedBox(
                height: height / 20,
              ),
              Text(
                primaryText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: secondaryFont,
                  fontSize: weight / 12,
                ),
              ),
              Text(
                secondaryText,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: weight / 15,
                  color: Colors.blueGrey,
                ),
              ),
              button
            ]),
          )),
    );
  }
}
