import 'package:flutter/material.dart';
import 'package:iMaz/pages/constants.dart';
import 'package:iMaz/Widgets/customAppBar.dart';
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
  final bool date;

  Student(
      {required this.image,
      required this.title,
      required this.day,
      required this.date});
}

class _ListPageState extends State<ListPage> {
  List itemList = [
    Student(
        image: "lib/assets/img/woman-1.png",
        title: "Yogesh Giri",
        date: false,
        day: "Awagarh"),
    Student(
        image: "lib/assets/img/girl-1.png",
        title: "Ashish Kumar",
        date: true,
        day: "Etawah"),
    Student(
        image: "lib/assets/img/girl.png",
        title: "Pankaj Jangda",
        date: false,
        day: "Haryana"),
    Student(
        image: "lib/assets/img/woman.png",
        title: "Arnest Paul",
        date: false,
        day: "Cannada"),
    Student(
        image: "lib/assets/img/man.png",
        title: "Bhuvnesh Giri",
        date: true,
        day: "Etah"),
    Student(
        image: "lib/assets/img/girl-1.png",
        title: "Ajay Dayal",
        date: false,
        day: "Patna"),
  ];
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDark = (brightness == Brightness.dark) ? 1 : 0;
    return Container(
      child: Column(
        children: [
          CustomAppBar(name: appName, place: "Agra", isSubPage: false),
          SizedBox(
            height: 1.h,
          ),
          Container(
            height: 12.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      // print('object');
                      Navigator.pushNamed(context, '/userData',
                          arguments: {'data': itemList[index]});
                    },
                    child: customCardCircle(data: itemList[index]),
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
                return GestureDetector(
                  onTap: () {
                    // print('object');
                    Navigator.pushNamed(context, '/userData',
                        arguments: {'data': itemList[index]});
                  },
                  child: customCard(data: itemList[index]),
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

customCard({required data}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 3.w),
    child: Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Image.asset(
            data.image,
            width: 10.w,
          ),
          title: Text(
            data.title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontFamily: secondaryFont),
          ),
          subtitle: Text(data.day),
          trailing: Text(
            data.date ? 'Offline' : 'Online',
            style: TextStyle(color: data.date ? Colors.green : Colors.red),
          ),
          style: ListTileStyle.drawer,
        ),
      ),
    ),
  );
}

customCardCircle({required data}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: .2.h, horizontal: 3.w),
    child: Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(4.w),
            width: 9.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: data.date
                  ? Color.fromARGB(103, 255, 193, 7)
                  : Color.fromARGB(147, 178, 255, 89),
            ),
            child: Image.asset(
              data.image,
            ),
          ),
          Text(
            data.title,
            style: TextStyle(
                fontFamily: secondaryFont,
                fontWeight: FontWeight.bold,
                fontSize: 2.3.w,
                height: .3.h,
                color: Colors.black),
          ),
        ],
      ),
    ),
  );
}
