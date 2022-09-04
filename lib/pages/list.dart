import 'package:flutter/material.dart';
import 'package:iMaz/pages/constants.dart';
import 'package:iMaz/pages/customAppBar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);
  @override
  State<ListPage> createState() => _ListPageState();
}

class Student {
  final String image;
  final String title;
  final String day;
  final String date;

  Student(
      {required this.image,
      required this.title,
      required this.day,
      required this.date});
}

class _ListPageState extends State<ListPage> {
  var itemList = [
    Student(
        image: "lib/assets/img/3d.png",
        title: "Yogesh Giri",
        date: "Online",
        day: "Awagarh"),
    Student(
        image: "lib/assets/img/3d.png",
        title: "Ashish Kumar",
        date: "Online",
        day: "Etawah"),
    Student(
        image: "lib/assets/img/3d.png",
        title: "Pankaj Jangda",
        date: "Online",
        day: "Haryana"),
    Student(
        image: "lib/assets/img/3d.png",
        title: "Arnest Paul",
        date: "Online",
        day: "Cannada"),
    Student(
        image: "lib/assets/img/3d.png",
        title: "Bhuvnesh Giri",
        date: "Online",
        day: "Etah"),
    Student(
        image: "lib/assets/img/3d.png",
        title: "Ajay Dayal",
        date: "Online",
        day: "Patna"),
  ];
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDark = (brightness == Brightness.dark) ? 1 : 0;
    return Container(
      child: Column(
        children: [
          CustomAppBar(),
          SizedBox(
            height: 1.h,
          ),
          Container(
            height: 12.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return customCardCircle(
                    image: itemList[index].image,
                    day: itemList[index].day,
                    date: itemList[index].date,
                    title: itemList[index].title,
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 0,
                  );
                },
                itemCount: itemList.length),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return customCard(
                  image: itemList[index].image,
                  day: itemList[index].day,
                  date: itemList[index].date,
                  title: itemList[index].title,
                );
              },
              itemCount: itemList.length,
            ),
          )
        ],
      ),
    );
  }
}

customCard({required image, required day, required date, required title}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 3.w),
    child: Card(
      elevation: 1,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              image,
              width: 10.w,
            ),
            title: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: secondaryFont),
            ),
            subtitle: Text(day),
            trailing: Text(
              date,
              style: TextStyle(color: Colors.green),
            ),
            style: ListTileStyle.drawer,
          )
          // Column(
          //   children: [
          //     Text(
          //       title,
          //       style: TextStyle(
          //           fontFamily: secondaryFont,
          //           fontWeight: FontWeight.bold,
          //           fontSize: 4.w),
          //     ),
          //     Row(
          //       children: [Text('$day - '), Text(date)],
          //     )
          //   ],
          // )
          // ],
          // ),
          ),
    ),
  );
}

customCardCircle(
    {required image, required day, required date, required title}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: .2.h, horizontal: 3.w),
    child: Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(4.w),
            width: 10.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: secondaryColor,
            ),
            child: Image.asset(
              image,
            ),
          ),
          Text(
            title,
            style: TextStyle(
                fontFamily: secondaryFont,
                fontWeight: FontWeight.bold,
                fontSize: 2.3.w),
          ),
        ],
      ),
    ),
  );
}
