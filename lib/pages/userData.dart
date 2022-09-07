import 'package:flutter/material.dart';
import 'package:iMaz/Widgets/customAppBar.dart';
import 'package:iMaz/pages/list.dart';
import 'package:iMaz/routes/routes.dart';
import 'package:sizer/sizer.dart';

class UserData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    var title = args['data'].title;
    var day = args['data'].day;

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
            Center(
              child: Text("Say Hello to ${title}"),
            )
          ],
        ),
      ),
    );
    return scaffold;
  }
}
