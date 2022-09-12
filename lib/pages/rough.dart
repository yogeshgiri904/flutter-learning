import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iMaz/Widgets/customAppBar.dart';
import 'package:iMaz/models/users.dart';
import 'package:iMaz/routes/routes.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

class RoughPage extends StatefulWidget {
  const RoughPage({Key? key}) : super(key: key);

  @override
  State<RoughPage> createState() => _RoughPageState();
}

class _RoughPageState extends State<RoughPage> {
  int isSelected = 2;
  String devName = 'Yogesh Giri';
  int age = 20;
  String appName = 'iMaz';

  List? _userDetails;

  Future<void> getUserDetails() async {
    var url = Uri.parse('http://13.126.90.63/auth/login/');
    var response = await http.post(url,
        body: {"email": "yogeshgiri904@gmail.com", "password": "9690484308"});
    // print('123=${response.body}');

    List userDetails = userFromJson(response.body);
    print(userDetails);
    // setState(() {
    //   _userDetails = userDetails;
    // });
  }

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
          child: Column(
        children: [
          CustomAppBar(
            name: "iMaz",
            place: "Agra",
            isSubPage: false,
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            width: 20.w,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Image.asset(
              'lib/assets/img/Me.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "Welcome in $appName",
            style: const TextStyle(
                fontSize: 20,
                height: 3,
                fontWeight: FontWeight.w900,
                color: Colors.blue),
          ),
          const Text(
            "Coming soon...",
            style: TextStyle(fontSize: 14, color: Colors.blue),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                minimumSize: const Size(200, 45)),
            child: const Text(
              "Sign Out",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.loginRoute);
            },
          ),
          // Container(
          //     child: _userDetails == null
          //         ? Text('Loading...')
          //         : ListView.builder(
          //             itemBuilder: ((context, index) {
          //               return Text('data');
          //             }),
          //             itemCount: 10,
          //           ))
        ],
      )),
    );
    return scaffold;
  }

  add({required int a, int b = 2}) {
    return a + b;
  }
}
