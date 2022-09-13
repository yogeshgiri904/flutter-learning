import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:iMaz/routes/routes.dart';
import 'package:sizer/sizer.dart';
import 'package:iMaz/pages/constants.dart';
import 'package:http/http.dart' as http;

class UserProfile extends StatefulWidget {
  static const devName = 'Yogesh Giri';

  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: primaryColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hii, $devName',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: secondaryFont,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                            fontSize: 3.w,
                            color: Colors.grey,
                            fontFamily: secondaryFont),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Icon(
                          Icons.notifications_rounded,
                        ),
                      ))
                ],
              ),
            ),
          ),
          Container(
            width: 100.w,
            height: 15.h,
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: pureWhite,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset(
                            'lib/assets/img/astronot.gif',
                            width: 40.w,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, MyRoutes.loginRoute);
                            },
                            child: Text(
                              '$devName',
                              style: TextStyle(
                                  color: pureWhite,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, MyRoutes.loginRoute);
                            },
                            child: Text(
                              'Software Engineer',
                              style: TextStyle(
                                color: Color.fromARGB(208, 207, 194, 194),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ),
          ),
          Container(
              height: 45.h,
              width: 100.w,
              child: Padding(
                padding: EdgeInsets.all(6.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dashboard',
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              )),
          Container(
            height: 10.h,
            width: 100.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.loginRoute);
                    },
                    child: Text(
                      'Switch to other account',
                      style: TextStyle(
                          color: defaultColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.loginRoute);
                    },
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
