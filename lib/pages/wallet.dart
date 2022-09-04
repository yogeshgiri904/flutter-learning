import 'package:flutter/material.dart';
import 'package:iMaz/pages/constants.dart';
import 'package:iMaz/pages/customAppBar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);
  @override
  State<WalletPage> createState() => _WalletPageState();
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

class _WalletPageState extends State<WalletPage> {
  var itemList = [
    Student(
        image: "1", title: "Yogesh Giri", date: "3700.09", day: "24 Aug 2022"),
    Student(
        image: "0", title: "Ashish Kumar", date: "203", day: "24 Sept 2022"),
    Student(
        image: "1",
        title: "Pankaj Jangda",
        date: "39040.89",
        day: "24 Aug 2022"),
    Student(image: "1", title: "Arnest Paul", date: "4509", day: "04 May 2022"),
    Student(
        image: "0",
        title: "Bhuvnesh Giri",
        date: "3200.78",
        day: "24 Aug 2022"),
    Student(image: "1", title: "Ajay Dayal", date: "4500", day: "24 Aug 2022"),
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
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
            child: Container(
              height: 25.h,
              child: Card(
                  elevation: 3,
                  color: secondaryColor,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('Yogesh Giri'),
                        subtitle: Text('ICICI Bank'),
                        trailing: Icon(
                          Icons.upgrade,
                          size: 10.w,
                        ),
                      ),
                    ],
                  )),
            ),
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
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.currency_rupee_sharp,
                  size: 8.w,
                )),
            title: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: secondaryFont),
            ),
            subtitle: Text(day),
            trailing: image == "1"
                ? Text(
                    ' + ${double.parse(date).toStringAsFixed(2)}',
                    style: TextStyle(
                        color: Colors.green,
                        fontFamily: secondaryFont,
                        fontWeight: FontWeight.bold),
                  )
                : Text(
                    ' - ${double.parse(date).toStringAsFixed(2)}',
                    style: TextStyle(
                        color: Colors.red,
                        fontFamily: secondaryFont,
                        fontWeight: FontWeight.bold),
                  ),
            style: ListTileStyle.drawer,
          )),
    ),
  );
}
